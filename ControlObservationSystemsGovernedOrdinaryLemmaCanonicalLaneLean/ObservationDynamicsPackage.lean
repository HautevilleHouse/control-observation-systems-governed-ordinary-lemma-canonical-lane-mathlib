import ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean.ControlObservationAdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean

structure ObservationDynamicsPackage where
  stateSpace : Type
  controlSet : Type
  observationSet : Type
  dynamics : stateSpace → controlSet → stateSpace
  observationMap : stateSpace → observationSet
  localControllability : Prop
  observabilityRankCondition : Prop
  reachableSet : stateSpace → Prop
  indistinguishableSet : stateSpace → stateSpace → Prop

def ObservationDynamicsPackageEvidence (pkg : ObservationDynamicsPackage) : Prop :=
  pkg.localControllability ∧ pkg.observabilityRankCondition

def ObservationDynamicsPackageClosed (pkg : ObservationDynamicsPackage) : Prop :=
  pkg.localControllability ∧ pkg.observabilityRankCondition

theorem observation_dynamics_package_closed_from_evidence
    (pkg : ObservationDynamicsPackage) (E : ObservationDynamicsPackageEvidence pkg) :
    ObservationDynamicsPackageClosed pkg := by
  exact E

end ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean
end HautevilleHouse