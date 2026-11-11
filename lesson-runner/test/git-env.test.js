// test/git-env.test.js
//
// Checks the settings every Git run gets, and that the snapshot of the practice folder leaves out Git's own folder.

'use strict';

const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');

const { PRACTICE_IDENTITY, gitEnvironment } = require('../core/git-env');
const { snapshotFolder, resetFolder } = require('../core/practice');

function tempFolder() {
  return fs.mkdtempSync(path.join(os.tmpdir(), 'git-env-test-'));
}

test('every run gets the practice identity, which belongs to no one', () => {
  const env = gitEnvironment({});
  assert.equal(env.GIT_AUTHOR_NAME, PRACTICE_IDENTITY.name);
  assert.equal(env.GIT_AUTHOR_EMAIL, PRACTICE_IDENTITY.email);
  assert.equal(env.GIT_COMMITTER_NAME, PRACTICE_IDENTITY.name);
  assert.equal(env.GIT_COMMITTER_EMAIL, PRACTICE_IDENTITY.email);
  assert.ok(PRACTICE_IDENTITY.email.endsWith('.invalid'), 'the practice address uses the reserved .invalid domain');
});

test('every run turns the pager off, and sets an editor that accepts the default message', () => {
  const env = gitEnvironment({});
  assert.equal(env.GIT_PAGER, 'cat');
  assert.equal(env.GIT_EDITOR, 'true');
});

test('every run turns Git colours off through the config environment', () => {
  const env = gitEnvironment({});
  assert.equal(env.GIT_CONFIG_COUNT, '1');
  assert.equal(env.GIT_CONFIG_KEY_0, 'color.ui');
  assert.equal(env.GIT_CONFIG_VALUE_0, 'never');
});

test('the existing environment, including PATH, is kept', () => {
  const env = gitEnvironment({ PATH: 'C:\\Program Files\\Git\\cmd', KEEP: 'yes' });
  assert.equal(env.PATH, 'C:\\Program Files\\Git\\cmd');
  assert.equal(env.KEEP, 'yes');
});

test('the snapshot leaves out the .git folder, so a files check never reads Git internals', () => {
  const folder = tempFolder();
  fs.writeFileSync(path.join(folder, 'README.md'), '# Notes\n', 'utf8');
  fs.mkdirSync(path.join(folder, '.git', 'objects'), { recursive: true });
  fs.writeFileSync(path.join(folder, '.git', 'HEAD'), 'ref: refs/heads/main\n', 'utf8');
  fs.writeFileSync(path.join(folder, '.git', 'objects', 'abc'), 'binary', 'utf8');

  assert.deepEqual(Object.keys(snapshotFolder(folder)), ['README.md']);
});

test('a reset deletes read-only files too, as Git object files are read-only on Windows', () => {
  const folder = tempFolder();
  const objects = path.join(folder, '.git', 'objects');
  fs.mkdirSync(objects, { recursive: true });
  const object = path.join(objects, 'read-only-object');
  fs.writeFileSync(object, 'stored', 'utf8');
  fs.chmodSync(object, 0o444);

  resetFolder(folder, folder);

  assert.ok(fs.existsSync(folder), 'the folder itself is kept');
  assert.deepEqual(fs.readdirSync(folder), []);
});
