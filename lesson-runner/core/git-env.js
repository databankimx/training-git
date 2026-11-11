// core/git-env.js
//
// The environment every run and check gets, so Git behaves the same way on every machine. The identity is a dummy: it
// belongs to no one, and it can't be mistaken for a real person's. The example.invalid domain is reserved, so it
// can't be a real address. The pager and editor settings stop a command from waiting for input. The colour setting
// keeps Git's output plain, so the expected output holds everywhere.

'use strict';

const PRACTICE_IDENTITY = {
  name: 'Practice Learner',
  email: 'practice@example.invalid',
};

// The settings a Git lesson needs, added to the environment the process already has.
function gitEnvironment(base = process.env) {
  return {
    ...base,
    GIT_AUTHOR_NAME: PRACTICE_IDENTITY.name,
    GIT_AUTHOR_EMAIL: PRACTICE_IDENTITY.email,
    GIT_COMMITTER_NAME: PRACTICE_IDENTITY.name,
    GIT_COMMITTER_EMAIL: PRACTICE_IDENTITY.email,
    // Turns the pager off, so long output doesn't wait for a key press.
    GIT_PAGER: 'cat',
    // Accepts the default for any command that would open an editor, so a stray commit can't hang a run.
    GIT_EDITOR: 'true',
    // Turns Git's colour codes off, for the same output on every machine. Needs Git 2.31 or later.
    GIT_CONFIG_COUNT: '1',
    GIT_CONFIG_KEY_0: 'color.ui',
    GIT_CONFIG_VALUE_0: 'never',
  };
}

module.exports = { PRACTICE_IDENTITY, gitEnvironment };
