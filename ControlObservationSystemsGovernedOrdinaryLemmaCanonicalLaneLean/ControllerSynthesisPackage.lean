import ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean.ObservationDynamicsPackage

namespace HautevilleHouse
namespace ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean

structure ControllerSynthesisPackage (pkg : ObservationDynamicsPackage) where
  feedbackLaw : pkg.stateSpace → pkg.controlSet
  closedLoopDynamics : pkg.stateSpace → pkg.stateSpace
  lyapunovFunction : pkg.stateSpace → ℝ
  asymptoticStability : Prop
  controlLyapunovCondition : Prop

def ControllerSynthesisPackageEvidence {pkg : ObservationDynamicsPackage}
    (ctrl : ControllerSynthesisPackage pkg) : Prop :=
  ctrl.asymptoticStability ∧ ctrl.controlLyapunovCondition

def ControllerSynthesisPackageClosed {pkg : ObservationDynamicsPackage}
    (ctrl : ControllerSynthesisPackage pkg) : Prop :=
  ctrl.asymptoticStability ∧ ctrl.controlLyapunovCondition

theorem controller_synthesis_package_closed_from_evidence
    {pkg : ObservationDynamicsPackage} (ctrl : ControllerSynthesisPackage pkg)
    (E : ControllerSynthesisPackageEvidence ctrl) :
    ControllerSynthesisPackageClosed ctrl := by
  exact E

end ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean
end HautevilleHouse