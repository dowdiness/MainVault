---
title: Under-Approximations and Over-Approximations
publish: false
tags: []
aliases: ["Under-Approximations and Over-Approximations: Definitions, Applications, and Relationship to Classification Outcomes", Under-Approximations and Over-Approximations]
created: 2025-05-13T03:27:16+09:00
modified: 2025-05-13T15:29:41+09:00
---

# Under-Approximations and Over-Approximations: Definitions, Applications, and Relationship to Classification Outcomes

## 1. Introduction

Approximation serves as a cornerstone in numerous scientific and engineering disciplines when dealing with the inherent complexities and uncertainties of real-world systems. In many instances, the pursuit of exact solutions encounters significant hurdles, often proving computationally intractable or even theoretically impossible. This reality necessitates the adoption of methods that can yield results with a sufficient degree of accuracy for practical purposes. This report aims to provide a clear and rigorous understanding of under-approximations and over-approximations within the distinct yet interconnected fields of computer science, mathematics, and formal methods. Furthermore, it will elucidate the critical relationship between these approximation concepts and the fundamental notions of true positives, false positives, true negatives, and false negatives, which are indispensable for evaluating the effectiveness and reliability of computational and analytical techniques across these domains. The necessity for employing approximation techniques often stems from fundamental limitations, such as the exponential growth of computational resources required for certain classes of problems 1, the continuous nature of many mathematical domains that defy exact digital representation, or the pragmatic need for efficient analytical methods in formal verification. The strategic choice between utilizing under-approximation and over-approximation reflects differing priorities concerning the types of errors that are deemed acceptable or more tolerable within a specific application context.

## 2. Defining Fundamental Concepts

### 2.1. Approximation

In its most general sense, an approximation can be defined as anything that is intentionally similar but not exactly equal to something else.2 The term originates from the Latin word "approximatus," which itself derives from "proximus," meaning very near, combined with the prefix "ad-," indicating a movement towards. Words like approximate, approximately, and approximation are particularly prevalent in technical and scientific contexts.2 The concept of approximation finds application across various properties, including value, quantity, image, and description, where the aim is to be nearly, but not exactly, correct, or similar, but not precisely the same.2 While approximation is most frequently associated with numerical values, its use extends to mathematical functions, shapes, and physical laws. Within the realm of science, approximation often involves the strategic use of a simpler process or model in situations where the correct or exact model proves too difficult or cumbersome to use.2 Moreover, the presence of incomplete information can also necessitate the adoption of approximate representations. The specific type of approximation employed is contingent upon several factors, including the information available, the degree of accuracy required for the task at hand, the sensitivity of the problem to the data being used, and the potential savings, typically in terms of time and effort, that can be realized through the use of approximation.2 It is worth noting that in mathematics, the symbol "≈," commonly used to denote approximately equal, lacks a universally accepted rigorous definition.3 Its meaning and interpretation often depend heavily on the specific mathematical context in which it is used. For instance, in the context of the trapezoidal rule for numerical integration, the approximation symbol signifies that the sequence of estimations obtained through the rule will converge to the actual value of the integral as the number of trapezoids increases.3 This highlights the importance of understanding the specific context when dealing with approximations in formal settings.

### 2.2. True Positives, False Positives, True Negatives, False Negatives

The concepts of true positives, false positives, true negatives, and false negatives are fundamental in evaluating the performance of binary classification tests, algorithms, and verification methods across a wide range of domains.4 These terms provide a structured way to categorize the outcomes of a binary prediction or decision process by comparing the predicted outcome with the actual or true outcome.

- **True Positive (TP):** A true positive occurs when a positive instance is correctly identified as positive.4 For example, if a spam filter correctly classifies an email as spam, this is a true positive.9 In medical testing, it refers to a sick person correctly identified as sick.5
    
- **False Positive (FP):** A false positive occurs when a negative instance is incorrectly identified as positive.4 This is akin to a "false alarm".6 If a spam filter incorrectly classifies a legitimate email as spam, this is a false positive.9 In medical testing, it refers to a healthy person incorrectly identified as sick.5 A false positive is also known as a Type I error.6
    
- **True Negative (TN):** A true negative occurs when a negative instance is correctly identified as negative.4 If a spam filter correctly classifies a legitimate email as not spam, this is a true negative.9 In medical testing, it refers to a healthy person correctly identified as healthy.5
    
- **False Negative (FN):** A false negative occurs when a positive instance is incorrectly identified as negative.4 This means something that is there was not detected; something was missed.6 If a spam filter incorrectly classifies a spam email as not spam, this is a false negative.9 In medical testing, it refers to a sick person incorrectly identified as healthy.5 A false negative is also known as a Type II error.6
    

It is crucial to recognize that the labels "positive" and "negative" are context-dependent and are determined by the specific problem being addressed.5 For instance, in the context of detecting bugs in software, a "positive" outcome might refer to the presence of a bug, while in disease diagnosis, it would refer to the presence of the disease. The significance and consequences of each type of error (false positive versus false negative) can vary dramatically depending on the domain and the application. For example, in security applications like malware detection, a false negative (failing to detect malware) might be considered more critical than a false positive (incorrectly flagging a safe file as malware).6 Conversely, in other scenarios, such as quality control, a false positive (rejecting a good quality item) might be more costly than a false negative (accepting a poor quality item).17 Understanding these fundamental concepts is essential for analyzing the relationship between approximation techniques and the outcomes of classification and verification processes.

## 3. Under-Approximation

### 3.1. In Computer Science and Formal Methods

#### 3.1.1. Definition and Characteristics

In the realms of computer science and formal methods, under-approximation is a technique that aims to provide a sound but potentially incomplete view of a system's behavior or state space.18 It focuses on identifying a subset of the actual possible behaviors or states, with the key characteristic that any result or conclusion derived from this subset is guaranteed to be correct with respect to the original, complete system. However, due to its nature of considering only a portion, an under-approximation might fail to capture all valid behaviors or reach all possible states of the system.18

A primary application of under-approximation lies in the domain of bug finding within software or hardware systems.18 By exploring a limited set of scenarios or execution paths, any bug that is discovered through under-approximation is highly likely to be a genuine issue, thus minimizing the occurrence of false positives (incorrectly reporting a bug when none exists).18 This approach is particularly valuable when the cost of investigating false alarms is high, or when the focus is on demonstrating the presence of at least one error. Peter O'Hearn's work on "incorrectness logic" exemplifies this, providing a formal framework based on under-approximation to prove the existence of bugs in programs without generating false positives.19 The core idea is to establish that a certain undesirable state or behavior is reachable through some execution of the system.

Despite its benefits in ensuring the validity of findings, designing effective under-approximation techniques can be a significant challenge.18 Research has highlighted inherent limitations in creating abstract domains that can reliably and usefully under-approximate program behaviors.18 Concepts such as "non-emptying functions" (functions where the output is always non-empty) and "highly surjective function families" (functions that can reach a large portion of their codomain) have been introduced to illustrate the difficulties in achieving non-trivial under-approximations for common programming constructs.18 These theoretical limits underscore the trade-offs involved in using under-approximation for comprehensive analysis.

#### 3.1.2. Examples

Several techniques in computer science and formal methods employ the principle of under-approximation:

- **Reachability Analysis:** In formal verification, under-approximating the set of reachable states of a system can be used to specifically target known error conditions or to explore a limited but guaranteed safe subset of states. For instance, the work on under-approximation of the state space of Petri nets using decision diagrams 21 demonstrates an approach to manage the complexity of state spaces by focusing on a subset.
    
- **Bug Finding via Symbolic Execution:** Symbolic execution is a program analysis technique where program variables are treated as symbolic values rather than concrete ones. By exploring different execution paths based on these symbolic values, it's possible to find inputs that lead to specific program states, such as error states. When symbolic execution explores only a finite number of paths, any bug found along these paths represents a real issue, thus serving as an under-approximation of all potential bugs.20
    
- **Testing:** Traditional software testing, where a system is executed with a finite set of carefully chosen inputs, can be seen as an under-approximation of the system's behavior across all possible inputs. If the system behaves correctly for these test cases, it provides a degree of confidence for those specific scenarios. However, it does not guarantee correctness for all other inputs.
    
- **Static Analysis for Bug Detection:** Some static analysis tools are designed with the primary goal of detecting definite bugs, even if it means missing other potential issues. These tools might employ under-approximation techniques to ensure that any reported warning corresponds to a real error in the code.18
    

#### 3.1.3. Second/Third-Order Insights

Under-approximation embodies a philosophy of prioritizing the accuracy of findings over the completeness of the analysis. When an under-approximating method reports a result, whether it's the existence of a bug or the satisfaction of a property within the explored subset, there is a higher degree of confidence in its validity. However, the inherent limitation of not exploring the entire system means that the absence of a reported issue does not necessarily imply its absence in the unexamined parts. The challenges in designing effective under-approximation abstract domains suggest that guaranteeing the discovery of all potential problems is more difficult than ensuring the correctness of the problems that are found. The emergence of "incorrectness logic" 18 signals a notable shift in formal methods, moving from a traditional focus on proving correctness (which often relies on over-approximation) towards a more direct approach of demonstrating incorrectness through under-approximation. This reflects a growing need for tools that can provide high-confidence bug findings, even if they are not exhaustive.

### 3.2. In Mathematics

#### 3.2.1. Definition and Characteristics

In mathematics, under-approximation refers to the process of finding a value or a function that is strictly less than or equal to the true value or function over a specified domain. It essentially provides a guaranteed lower bound. Under-approximations are particularly useful in scenarios where establishing a definite lower estimate is crucial, such as in the context of bounding the value of integrals or in various applications within numerical analysis.

#### 3.2.2. Examples

Several mathematical techniques rely on the principle of under-approximation:

- **Lower Riemann Sums:** When approximating the definite integral of a function over an interval using Riemann sums, the lower Riemann sum is constructed by using rectangles whose height on each subinterval is determined by the minimum value of the function within that subinterval.23 The sum of the areas of these rectangles provides a value that is guaranteed to be less than or equal to the actual area under the curve, thus serving as an under-approximation of the definite integral.
    
- **Linear Approximation (for Concave Up Functions):** For a function that is concave up over an interval, the tangent line at any point within that interval will lie below or on the curve.30 Consequently, the value of the tangent line at a point near the point of tangency provides an under-approximation of the function's actual value at that point.
    
- **Truncated Series:** If we consider a convergent infinite series where all the terms are positive, then any partial sum obtained by taking a finite number of terms will be strictly less than the total sum of the series. This partial sum represents an under-approximation of the series' value.
    

#### 3.2.3. Second/Third-Order Insights

The significance of under-approximation in mathematics lies in its ability to establish guaranteed lower bounds. These bounds are essential in various applications, such as ensuring safety margins in engineering, setting minimal performance guarantees, or providing a basis for rigorous mathematical proofs. The connection between the concavity of a function and whether its linear approximation yields an under- or over-estimate 30 underscores the importance of understanding the properties of the mathematical object being approximated. The explicit construction of lower Riemann sums ensures that the calculated area is definitively no larger than the true area, providing a reliable lower limit.

### 3.3. Relationship to True/False Negatives

In the context of verification or classification, under-approximation's focus on a subset of possibilities can lead to a failure in identifying some true positive cases. This directly relates to the concept of **false negatives**.15 An under-approximating bug-finding tool, for example, might miss actual bugs (false negatives) if those bugs are triggered by program behaviors that were not part of the analyzed subset. Similarly, in mathematics, if an under-approximation is used to check whether a value exceeds a specific threshold, and the approximation falls below this threshold while the true value is actually above it, this scenario is analogous to a false negative. The system incorrectly reports that the condition (exceeding the threshold) is negative when it is, in fact, positive. The fundamental trade-off inherent in under-approximation is the balance between the reliability of the findings (minimizing false positives) and the potential for overlooking some true instances (resulting in false negatives). The severity of false negatives is highly dependent on the application domain; in critical systems, missing a positive case (like a bug or a disease) can have severe consequences.

## 4. Over-Approximation

### 4.1. In Computer Science and Formal Methods

#### 4.1.1. Definition and Characteristics

Over-approximation, in computer science and formal methods, is a technique that aims to encompass all possible behaviors or states of a system by considering a superset of them.18 The primary goal of over-approximation is to achieve soundness in verification, meaning that if an over-approximating analysis concludes that a certain property holds (e.g., the absence of errors), then this conclusion is guaranteed to be true for the actual system.32 This completeness in coverage comes at the potential cost of including behaviors or states that are not actually reachable or possible in the real system, which can lead to false positives (incorrectly reporting an issue or a positive outcome).18

Over-approximation is a cornerstone of many formal verification techniques, particularly in static analysis and model checking, where the objective is often to prove safety properties of software or hardware systems.41 By analyzing an over-approximation of the system's state space or transitions, if it can be shown that no error state is reachable within this expanded scope, then it logically follows that the error state is also unreachable in the original, more constrained system. Abstract interpretation, a prominent theory in formal methods, relies heavily on the concept of over-approximation to abstract the program semantics and provide a sound estimate of potential errors.42 Similarly, in the verification of parameterized systems, abstracting the system with a fixed number of processes whose transition relation over-approximates the original system allows for the verification of safety properties across an unbounded number of processes.40

#### 4.1.2. Examples

Several widely used techniques in computer science and formal methods employ over-approximation:

- **Abstract Interpretation:** This technique uses abstract domains to represent sets of concrete program states. These abstract domains often over-approximate the actual reachable states, ensuring that all possible states are covered. Static analysis tools based on abstract interpretation can then prove safety properties by showing that no abstract state representing an error condition is reachable.41 For example, Astrée is a static analyzer that uses abstract interpretation to over-approximate the behavior of critical avionics software to guarantee the absence of run-time errors.49
    
- **Approximation Algorithms:** In dealing with computationally hard optimization problems, approximation algorithms aim to find near-optimal solutions within a reasonable time frame. These algorithms often provide a guarantee on the quality of the solution found, usually expressed as a factor of the optimal solution.1 For instance, a ρ-approximation algorithm for a minimization problem will always return a solution that is at most ρ times the optimal value. The set of solutions considered by the algorithm can be seen as an over-approximation of the set of optimal solutions in terms of their cost or value.
    
- **Model Checking with Abstraction:** Model checking is a formal verification technique that explores all possible states of a system to check if it satisfies certain properties. To handle the state explosion problem in large systems, abstraction techniques are used to create smaller, more tractable models. These abstract models often over-approximate the behavior of the original system. If a property is verified on the abstract model, it holds for the concrete system.40 Predicate abstraction 43 is a common technique where the abstract state is defined by the truth values of a set of predicates over the program variables, potentially leading to an over-approximation of the reachable state space.
    
- **Localization Reduction:** In hardware verification, localization reduction is a technique used to create an abstract model of a circuit by removing a number of latches and their associated logic. The resulting abstract model over-approximates the original circuit with respect to reachability properties. If a property holds on this abstraction, it is guaranteed to hold on the original circuit as well.53
    

#### 4.1.3. Second/Third-Order Insights

Over-approximation prioritizes the completeness of the analysis in terms of covering all actual behaviors, even if it includes some that are spurious. This approach is crucial for proving the absence of errors, as any error in the real system would also manifest in the over-approximated model. However, a significant drawback is the potential for a high number of false positives, where the analysis reports issues or behaviors that cannot actually occur. The effectiveness of over-approximation hinges on the ability to refine the abstractions used to minimize these false positives while still maintaining the essential property of soundness. The prevalence of over-approximation in safety-critical domains underscores the paramount importance of guaranteeing the absence of errors, even if it requires dealing with and mitigating false alarms.

### 4.2. In Mathematics

#### 4.2.1. Definition and Characteristics

In mathematics, over-approximation involves finding a value or a function that is strictly greater than or equal to the true value or function over a given domain. It provides a guaranteed upper bound. Over-approximations are invaluable in situations where establishing a definite upper estimate is necessary, such as when bounding the value of integrals or in various methods within numerical analysis.

#### 4.2.2. Examples

Several mathematical techniques utilize the concept of over-approximation:

- **Upper Riemann Sums:** When approximating the definite integral of a function using Riemann sums, the upper Riemann sum is constructed by using rectangles whose height on each subinterval is determined by the maximum value of the function within that subinterval.23 The sum of the areas of these rectangles provides a value that is guaranteed to be greater than or equal to the actual area under the curve, thus serving as an over-approximation of the definite integral.
    
- **Linear Approximation (for Concave Down Functions):** For a function that is concave down over an interval, the tangent line at any point within that interval will lie above or on the curve.30 Consequently, the value of the tangent line at a point near the point of tangency provides an over-approximation of the function's actual value at that point.
    
- **Bounding Functions:** In mathematical analysis, it is often useful to find a simpler function that is always greater than or equal to a more complex function over a certain domain. This bounding function can then be used to simplify analysis, estimate bounds, or prove properties of the original function.
    

#### 4.2.3. Second/Third-Order Insights

The utility of over-approximation in mathematics lies in its capacity to establish guaranteed upper bounds. These bounds are critical in various applications, including optimization problems where an upper limit on the objective function is needed, or when determining worst-case scenarios in modeling. Similar to under-approximation, the characteristics of the function being approximated, such as its concavity, determine whether a linear approximation will be an over- or under-estimate.30 The construction of upper Riemann sums explicitly yields an area that is guaranteed to be no smaller than the true area, providing a reliable upper limit.

### 4.3. Relationship to True/False Positives

In the context of verification or classification, over-approximation's expanded scope can lead to incorrectly identifying some negative cases as positive. This relates to the concept of **false positives**.15 An over-approximating static analysis tool might report a potential security vulnerability (a positive outcome) in a code path that is never actually executed (a negative true outcome). In mathematics, if an over-approximation is used to predict whether a value will exceed a certain threshold, and the approximation does exceed it while the true value does not, this could lead to an incorrect positive classification, analogous to a false positive. The fundamental trade-off in over-approximation is between ensuring that all actual positive instances are covered (minimizing false negatives in proving the absence of errors) and the potential for generating false alarms (false positives). The number of false positives is a critical metric for evaluating the practicality of over-approximating tools, as an excessive number of false alarms can render the tool unusable due to the effort required to manually inspect and dismiss them.

## 5. The Interplay and Trade-offs

A fundamental consideration when employing approximation techniques is the inherent trade-off between the precision offered by exact methods and the scalability afforded by approximations.48 While exact solutions are desirable for their accuracy, they often come with a prohibitive computational cost, especially for complex problems. Approximation techniques offer a way to obtain results within acceptable resource constraints, but they introduce the possibility of errors.

Under-approximation and over-approximation represent two distinct strategies in this landscape, each with its own set of trade-offs regarding the types of errors they are prone to.32 Under-approximation, by focusing on a subset of the system's behavior, tends to minimize the risk of false positives. Any result obtained is likely to be correct within the scope of the approximation. However, this comes at the cost of potentially missing some true positive cases, leading to an increase in false negatives. Conversely, over-approximation aims to cover all possible scenarios by considering a superset of the system's behavior. This approach is effective in minimizing false negatives, particularly in proving the absence of errors. If an over-approximating analysis finds no violations, it provides a strong guarantee. However, the inclusion of spurious behaviors can lead to an increase in false positives, where issues are reported that do not actually exist in the real system.

The choice between under- and over-approximation is not arbitrary but depends critically on the specific application and the associated costs of each type of error.32 In safety-critical systems, such as those controlling aircraft or medical equipment 48, the consequences of a false negative (missing a potentially catastrophic error) far outweigh the burden of investigating false positives (spurious warnings). In such domains, over-approximation is the preferred strategy to ensure that no actual error is overlooked. On the other hand, in contexts like bug hunting in software or detecting security vulnerabilities, a high rate of false positives can be detrimental.32 Developers might become overwhelmed by a flood of incorrect warnings, making it difficult to identify and address the real issues. In these scenarios, under-approximation, where any reported bug is more likely to be genuine, might be more desirable, even if it means that some bugs could potentially be missed.

Recognizing the limitations of relying solely on either under- or over-approximation, some advanced approaches aim to combine the strengths of both techniques.43 These hybrid methods attempt to leverage the accuracy of under-approximation in certain aspects while using over-approximation to ensure broader coverage, striving for a better balance between precision and completeness. The development of such integrated strategies reflects an ongoing effort to create more effective and practical analysis tools. The inherent inverse relationship between false positives and false negatives in many analysis tools 32 highlights the challenge of achieving both high precision and high recall. The most effective tools are often those that can strike an optimal balance tailored to the specific needs and priorities of the application.

## 6. Illustrative Examples and Case Studies

### 6.1. Computer Science

#### 6.1.1. Approximation Algorithms for NP-hard Problems

Many problems in computer science, particularly those in the realm of combinatorial optimization, are classified as NP-hard. For these problems, finding an exact solution in polynomial time is widely believed to be impossible under the P ≠ NP conjecture.1 To address this, computer scientists often resort to designing approximation algorithms, which are efficient algorithms that can find solutions that are provably close to the optimal solution.1 The quality of an approximation algorithm is typically expressed as an approximation ratio, which provides a guarantee on the distance of the returned solution from the optimal one.50

Consider the Vertex Cover problem, where the goal is to find the smallest set of vertices in a graph such that every edge is incident to at least one vertex in the set. This problem is NP-hard. A simple 2-approximation algorithm for Vertex Cover works by repeatedly picking an edge, adding both its endpoints to the cover, and removing all incident edges. The size of the vertex cover found by this algorithm is guaranteed to be at most twice the size of the optimal vertex cover.50 In the context of verification, if we were trying to find a minimal set of resources (analogous to vertices) needed to handle all tasks (analogous to edges), this approximation algorithm would provide an over-approximation of the minimal set. We might end up selecting more resources than absolutely necessary (a potential false positive in a minimal set identification task), but we are guaranteed that all tasks will be handled (avoiding a false negative in terms of not covering all tasks).

#### 6.1.2. Approximate Computing

Approximate computing is a paradigm that intentionally trades off the accuracy of computation for gains in efficiency, such as reduced power consumption or improved performance.2 This approach is based on the observation that many applications, especially in areas like machine learning, signal processing, and multimedia, can tolerate some degree of imprecision in their results without significantly affecting the overall quality of the output.2

One example of approximate computing is the use of reduced-precision arithmetic. Instead of using standard 32-bit or 64-bit floating-point numbers, computations might be performed with 16-bit or even 8-bit representations. This can lead to faster computations and lower power consumption but introduces approximation errors due to the reduced precision. In a verification scenario, if we were verifying the correctness of a computation, an over-approximation might involve assuming a higher level of imprecision in the input data than actually exists. This could lead to a false positive if the verification flags a potential issue that would only arise under this exaggerated level of imprecision. Conversely, an under-approximation might involve using a precision level that is too low, potentially missing subtle errors that only become apparent at higher precision (a false negative).

### 6.2. Formal Methods

#### 6.2.1. Static Analysis Tools

Static analysis tools analyze the source code of a program without executing it to detect potential errors or verify properties.44 Many static analyzers, especially those aimed at proving safety properties, employ over-approximation techniques. For instance, tools based on abstract interpretation, like Astrée used in the avionics industry 49, compute an over-approximation of the set of reachable states of a program. If the analysis determines that no error state (e.g., null pointer dereference, division by zero) is reachable within this over-approximated state space, then it provides a formal guarantee that these errors will not occur in any execution of the program. This soundness (no false negatives regarding the checked properties) is a key advantage. However, the over-approximation might also include states or execution paths that are not actually feasible in the real program, leading to false positives – warnings about potential errors that cannot actually occur.32 The effectiveness of these tools often depends on techniques to refine the abstractions used, thereby reducing the number of false positives while preserving soundness.

#### 6.2.2. Model Checking Techniques using Abstraction

Model checking is a powerful formal verification technique that systematically explores all possible states of a finite-state system to check if it satisfies a given specification, often expressed in temporal logic.48 However, real-world systems can have an enormous number of states, leading to the state explosion problem. To mitigate this, abstraction techniques are often used to create smaller, more manageable models that are easier to verify.43 One common approach is predicate abstraction, where the abstract model is based on a set of predicates over the system's variables. The abstract model derived through these techniques can be an over-approximation of the concrete system. If a property holds in the abstract model, it is guaranteed to hold in the concrete one (soundness). However, the over-approximation might introduce spurious counterexamples – sequences of transitions in the abstract model that violate the property but do not correspond to any actual execution in the concrete system. These spurious counterexamples are essentially false positives. Refinement techniques, such as counterexample-guided abstraction refinement (CEGAR), are then used to iteratively refine the abstraction by adding more predicates to eliminate these false positives.43

### 6.3. Mathematics

#### 6.3.1. Numerical Integration (Riemann Sums, Trapezoidal Rule)

Numerical integration techniques are used to approximate the value of a definite integral when an analytical solution is difficult or impossible to find.26 Riemann sums provide a basic method for this approximation by dividing the area under the curve into a series of rectangles and summing their areas.23 Upper Riemann sums, where the height of each rectangle is the maximum value of the function on the subinterval, provide an over-approximation of the integral's value. Conversely, lower Riemann sums, using the minimum value on each subinterval, give an under-approximation.23

The Trapezoidal Rule is another numerical integration method that approximates the area under the curve by using trapezoids instead of rectangles.3 In general, the Trapezoidal Rule provides a more accurate approximation than basic Riemann sums. Whether the Trapezoidal Rule yields an over- or under-approximation depends on the concavity of the function over the interval of integration.28 If the function is concave down, the trapezoids will lie above the curve, resulting in an over-approximation. If the function is concave up, the trapezoids will lie below the curve, giving an under-approximation. In the context of calculating an area, an over-approximation includes more area than the true value (akin to a "false positive" if we consider the true area the target), while an under-approximation includes less area ("false negative").

#### 6.3.2. Linear Approximations

Linear approximations use the tangent line to a function at a particular point to estimate the function's value at nearby points.30 The accuracy of this approximation depends on how close the point of interest is to the point of tangency and the behavior of the function (specifically its second derivative, which indicates concavity). If the function is concave down in the region around the point of tangency, the tangent line will lie above the curve, providing an over-approximation of the function's value. Conversely, if the function is concave up, the tangent line will lie below the curve, resulting in an under-approximation.30 If a linear approximation is used to estimate whether a function exceeds a certain threshold, an overestimate might lead to a "false positive" conclusion (the approximation exceeds the threshold, but the true value does not), while an underestimate might lead to a "false negative" (the approximation is below the threshold, but the true value is above).

### 6.4. Connecting to True/False Positives/Negatives

The following table summarizes the relationship between approximation types and their potential association with false positives and false negatives across different domains:

|   |   |   |   |   |
|---|---|---|---|---|
|**Domain**|**Approximation Type**|**Relates to**|**Explanation**|**Snippet IDs**|
|CS/FM|Under-approximation|False Negatives (missing true bugs, behaviors, or states)|By exploring only a subset, some actual positive instances might be missed, leading to an incorrect negative report.|18|
|CS/FM|Over-approximation|False Positives (reporting non-existent bugs, behaviors, or states)|By considering a superset, some reported issues or behaviors might not actually exist in the real system.|18|
|Mathematics|Under-approximation|Potential False Negatives (underestimating a value that should exceed a threshold)|If an under-approximation is below a threshold, the true value might still be above, leading to a missed positive condition.|23|
|Mathematics|Over-approximation|Potential False Positives (overestimating a value that might incorrectly trigger a positive classification based on a threshold)|If an over-approximation is above a threshold, the true value might still be below, leading to an incorrect positive classification.|23|

This table explicitly illustrates the general tendency of under-approximation to be associated with a higher risk of false negatives, where true positive instances are missed, and over-approximation to be more prone to generating false positives, where negative instances are incorrectly reported as positive. The examples discussed further highlight how the specific techniques of under- and over-approximation in each domain can manifest these relationships in practical scenarios.

## 7. Conclusion

In summary, under-approximation and over-approximation are fundamental techniques employed across computer science, mathematics, and formal methods to handle complexity and uncertainty. Under-approximation involves considering a subset of the actual behavior or values, aiming for soundness in the findings but potentially missing some true instances. Over-approximation, on the other hand, considers a superset, striving for completeness in coverage but at the risk of including spurious results.

The relationship between these approximation techniques and the concepts of true positives, false positives, true negatives, and false negatives is crucial for understanding their implications in verification and classification tasks. Under-approximation is often linked to a higher likelihood of false negatives, where true positive cases might be missed due to the limited scope of the approximation. Conversely, over-approximation carries a greater risk of false positives, where the expanded scope might lead to incorrect positive reports for negative instances.

The careful selection of an appropriate approximation technique is paramount. This decision must be guided by the specific goals of the analysis or computation, the acceptable level of error, and, most importantly, a thorough consideration of the relative costs and consequences associated with false positives versus false negatives in the particular application domain. Understanding these trade-offs is essential for effectively utilizing approximation techniques and interpreting the results derived from them. Future advancements in this area may focus on developing more adaptive and intelligent methods that can dynamically manage the level of approximation or integrate under- and over-approximation strategies to minimize both types of errors, ultimately leading to more robust and reliable computational and analytical tools.