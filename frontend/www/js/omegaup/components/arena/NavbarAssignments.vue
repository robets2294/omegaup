<template>
  <div class="navbar-assignments">
    <button
      class="btn btn-primary col-md-12 col-sm-12 col-xs-12"
      v-on:click="$emit('navigate-to-assignment', previousAssignment.alias)"
      v-bind:disabled="previousAssignment === null"
      v-bind:title="previousAssignment !== null ? previousAssignment.name : ''"
      role="button"
    >
      <span
        class="glyphicon glyphicon-chevron-left"
        aria-hidden="true"
        v-if="previousAssignment !== null"
      ></span
      >{{ previousAssignment !== null ? previousAssignment.name : '-' }}
    </button>
    <button
      class="btn btn-primary col-md-12 col-sm-12 col-xs-12"
      v-on:click="$emit('navigate-to-assignment', nextAssignment.alias)"
      v-bind:disabled="nextAssignment === null"
      v-bind:title="nextAssignment !== null ? nextAssignment.name : ''"
      role="button"
    >
      {{ nextAssignment !== null ? nextAssignment.name : '-'
      }}<span
        class="glyphicon glyphicon-chevron-right"
        aria-hidden="true"
        v-if="nextAssignment !== null"
      ></span>
    </button>
  </div>
</template>

<style>
.navbar-assignments > button {
  margin-bottom: 0.5em;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
</style>

<script lang="ts">
import { Vue, Component, Prop } from 'vue-property-decorator';
import omegaup from '../../api.js';
import { T } from '../../omegaup.js';

@Component
export default class ArenaNavbarAssignments extends Vue {
  @Prop() assignments!: omegaup.Assignment[];
  @Prop() currentAssignmentAlias!: string;

  T = T;

  get previousAssignment(): omegaup.Assignment | null {
    if (this.currentAssignmentIndex === 0) {
      return null;
    }
    return this.assignments[this.currentAssignmentIndex - 1];
  }

  get nextAssignment(): omegaup.Assignment | null {
    if (this.currentAssignmentIndex === this.assignments.length - 1) {
      return null;
    }
    return this.assignments[this.currentAssignmentIndex + 1];
  }

  private get currentAssignmentIndex(): number {
    // Getting index of current assignment
    return this.assignments.findIndex(
      assignment => assignment.alias === this.currentAssignmentAlias,
    );
  }
}
</script>
