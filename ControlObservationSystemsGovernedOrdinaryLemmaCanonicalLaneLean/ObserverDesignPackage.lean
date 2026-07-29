import ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean.ControllerSynthesisPackage

namespace HautevilleHouse
namespace ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean

structure ObserverDesignPackage {pkg : ObservationDynamicsPackage}
    (ctrl : ControllerSynthesisPackage pkg) where
  observerStateSpace : Type
  observerDynamics : observerStateSpace → pkg.observationSet → observerStateSpace
  estimationMap : observerStateSpace → pkg.stateSpace
  convergenceRate : Prop
  persistentExcitationCondition : Prop

def ObserverDesignPackageEvidence {pkg : ObservationDynamicsPackage}
    {ctrl : ControllerSynthesisPackage pkg} (obs : ObserverDesignPackage ctrl) : Prop :=
  obs.convergenceRate ∧ obs.persistentExcitationCondition

def ObserverDesignPackageClosed {pkg : ObservationDynamicsPackage}
    {ctrl : ControllerSynthesisPackage pkg} (obs : ObserverDesignPackage ctrl) : Prop :=
  obs.convergenceRate ∧ obs.persistentExcitationCondition

theorem observer_design_package_closed_from_evidence
    {pkg : ObservationDynamicsPackage} {ctrl : ControllerSynthesisPackage pkg}
    (obs : ObserverDesignPackage ctrl) (E : ObserverDesignPackageEvidence obs) :
    ObserverDesignPackageClosed obs := by
  exact E

end ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean
end HautevilleHouse