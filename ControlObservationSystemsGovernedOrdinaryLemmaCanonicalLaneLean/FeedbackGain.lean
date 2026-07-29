import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean

structure FeedbackGain (O : ControlObservationSystem) where
  gain : O.observationSpace → O.controlSpace
  stabilizesDynamics : Prop
  continuousGain : Continuous gain
  gainRespectsConstraints : ∀ (x : O.observationSpace), gain x ∈ O.admissibleControlSet
  stabilizesDynamicsClosed : stabilizesDynamics

def FeedbackGainClosed {O : ControlObservationSystem} (F : FeedbackGain O) : Prop :=
  F.continuousGain ∧ (∀ (x : O.observationSpace), F.gain x ∈ O.admissibleControlSet) ∧ F.stabilizesDynamics

theorem feedback_gain_closed_from_gain {O : ControlObservationSystem} (F : FeedbackGain O) : FeedbackGainClosed F := by
  exact And.intro F.continuousGain (And.intro F.gainRespectsConstraints F.stabilizesDynamicsClosed)

structure OptimalFeedbackGain (O : ControlObservationSystem) extends FeedbackGain O where
  costFunctional : (O.stateSpace → O.controlSpace) → ℝ
  optimalityCondition : costFunctional this.toFeedbackGain.gain = 0
  optimalityConditionClosed : optimalityCondition

def OptimalFeedbackGainClosed {O : ControlObservationSystem} (F : OptimalFeedbackGain O) : Prop :=
  FeedbackGainClosed F.toFeedbackGain ∧ F.optimalityCondition

theorem optimal_feedback_gain_closed_from_gain {O : ControlObservationSystem} (F : OptimalFeedbackGain O) : OptimalFeedbackGainClosed F := by
  exact And.intro (feedback_gain_closed_from_gain F.toFeedbackGain) F.optimalityConditionClosed

end ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean
end HautevilleHouse