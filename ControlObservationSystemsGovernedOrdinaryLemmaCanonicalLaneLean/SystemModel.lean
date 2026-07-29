import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean

structure ControlObservationSystem where
  stateSpace : Type u
  observationSpace : Type v
  controlSpace : Type w
  dynamics : stateSpace → controlSpace → stateSpace
  observationMap : stateSpace → observationSpace
  governedOrdinaryLemma : Prop
  lemmaEvidence : governedOrdinaryLemma

structure SystemModelPackage where
  system : ControlObservationSystem
  stateTopology : TopologicalSpace system.stateSpace
  observationTopology : TopologicalSpace system.observationSpace
  controlTopology : TopologicalSpace system.controlSpace
  continuousDynamics : Continuous (fun (x : system.stateSpace × system.controlSpace) => system.dynamics x.1 x.2)
  continuousObservation : Continuous system.observationMap
  admissibleControlSet : Set system.controlSpace
  lemmaApplied : system.governedOrdinaryLemma

def SystemModelClosed (S : SystemModelPackage) : Prop :=
  S.continuousDynamics ∧ S.continuousObservation ∧ S.admissibleControlSet.Nonempty ∧ S.lemmaApplied

structure SystemModelEvidence (S : SystemModelPackage) where
  continuousDynamicsClosed : S.continuousDynamics
  continuousObservationClosed : S.continuousObservation
  admissibleControlSetNonemptyClosed : S.admissibleControlSet.Nonempty
  lemmaAppliedClosed : S.lemmaApplied

theorem system_model_closed_from_evidence (S : SystemModelPackage) (E : SystemModelEvidence S) : SystemModelClosed S := by
  exact And.intro E.continuousDynamicsClosed (And.intro E.continuousObservationClosed (And.intro E.admissibleControlSetNonemptyClosed E.lemmaAppliedClosed))

end ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean
end HautevilleHouse