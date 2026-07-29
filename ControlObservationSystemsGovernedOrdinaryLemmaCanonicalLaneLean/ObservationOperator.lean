import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean

structure ObservationOperator (O : ControlObservationSystem) where
  observationSpace' : Type
  linearOperator : O.observationSpace → observationSpace'
  boundedLinear : Prop
  injectiveOnClosure : Prop
  kernelCharacterization : Prop
  boundedLinearClosed : boundedLinear
  injectiveOnClosureClosed : injectiveOnClosure
  kernelCharacterizationClosed : kernelCharacterization

structure ObservationOperatorPackage (O : ControlObservationSystem) where
  operator : ObservationOperator O
  operatorDomainComplete : Prop
  operatorRangeClosed : Prop
  operatorDomainCompleteClosed : operatorDomainComplete
  operatorRangeClosedClosed : operatorRangeClosed

def ObservationOperatorClosed {O : ControlObservationSystem} (P : ObservationOperatorPackage O) : Prop :=
  P.operatorDomainComplete ∧ P.operatorRangeClosed

structure ObservationOperatorEvidence {O : ControlObservationSystem} (P : ObservationOperatorPackage O) where
  operatorDomainCompleteClosed : P.operatorDomainComplete
  operatorRangeClosedClosed : P.operatorRangeClosed

theorem observation_operator_closed_from_evidence {O : ControlObservationSystem} (P : ObservationOperatorPackage O) (E : ObservationOperatorEvidence P) : ObservationOperatorClosed P := by
  exact And.intro E.operatorDomainCompleteClosed E.operatorRangeClosedClosed

end ControlObservationSystemsGovernedOrdinaryLemmaCanonicalLaneLean
end HautevilleHouse