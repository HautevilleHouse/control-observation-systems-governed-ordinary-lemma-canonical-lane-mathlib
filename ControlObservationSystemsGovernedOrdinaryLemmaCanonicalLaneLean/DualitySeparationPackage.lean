import ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean.ObserverDesignPackage

namespace HautevilleHouse
namespace ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean

structure DualitySeparationPackage {pkg : ObservationDynamicsPackage}
    {ctrl : ControllerSynthesisPackage pkg} (obs : ObserverDesignPackage ctrl) where
  controllabilityImpliesObservability : Prop
  observabilityImpliesControllability : Prop
  seperationPrincipleHolds : Prop
  controllerObserverCompositionStable : Prop

def DualitySeparationPackageEvidence {pkg : ObservationDynamicsPackage}
    {ctrl : ControllerSynthesisPackage pkg} {obs : ObserverDesignPackage ctrl}
    (D : DualitySeparationPackage obs) : Prop :=
  D.controllabilityImpliesObservability ∧ D.observabilityImpliesControllability ∧
  D.seperationPrincipleHolds ∧ D.controllerObserverCompositionStable

def DualitySeparationPackageClosed {pkg : ObservationDynamicsPackage}
    {ctrl : ControllerSynthesisPackage pkg} {obs : ObserverDesignPackage ctrl}
    (D : DualitySeparationPackage obs) : Prop :=
  D.controllabilityImpliesObservability ∧ D.observabilityImpliesControllability ∧
  D.seperationPrincipleHolds ∧ D.controllerObserverCompositionStable

theorem duality_separation_package_closed_from_evidence
    {pkg : ObservationDynamicsPackage} {ctrl : ControllerSynthesisPackage pkg}
    {obs : ObserverDesignPackage ctrl} (D : DualitySeparationPackage obs)
    (E : DualitySeparationPackageEvidence D) : DualitySeparationPackageClosed D := by
  exact And.intro E.controllabilityImpliesObservability
    (And.intro E.observabilityImpliesControllability
      (And.intro E.seperationPrincipleHolds E.controllerObserverCompositionStable))

end ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean
end HautevilleHouse