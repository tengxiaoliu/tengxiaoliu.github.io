+++
title= "Greetings! :wave:"
type= "about"
+++

I'm Tengxiao Liu, a third-year MSc student at Fudan University, advised by Prof. [Xipeng Qiu](https://xpqiu.github.io). Meanwhile, I'm currently a research intern at AWS Shanghai AI Lab, working closely with Prof. [Yue Zhang](https://frcchang.github.io/) and Prof. [Zheng Zhang](https://research.shanghai.nyu.edu/cn/centers-and-institutes/datascience/people/zheng-zhang).
Before joining Fudan, I received my bachelor degree at Xi'an Jiaotong University in 2021.

I am currently working in the area of Natural Language Processing and its applications, especially Question Answering and LLM reasoning.

[\[Github\]](https://github.com/tengxiaoliu/) [\[CV\]](https://tengxiaoliu.github.io/file/cv_Tengxiao_Liu.pdf) 

## Education

* **Fudan University** (2021 - expected 2024)

Master of Science in Computer Science

Supervisor: Prof. Xipeng Qiu

* **Xi'an Jiaotong University** (2017 - 2021)

Bachelor of Honors Science Program (Computer Science)

GPA: 91.92 / 100, Ranking: 2 / 32

* **University of California, Berkeley** (Spring 2020)

GPA: 4.0/4.0, Berkeley International Study Program - Letters & Science (Computer Science)

* **Xi'an Jiaotong University** (2015 - 2017)

Honor's Youth Program


## Experience

* **Amazon AWS AI** (Mar 2021 - Present) Research intern at AWS Shanghai AI Lab, advised by Dr. Qipeng Guo, Prof. Yue Zhang and Prof. Zheng Zhang

* **University of California, San Francisco** (Feb 2020 - Mar 2021)
Undergraduate research assistant at Big Data in Radiology, UCSF, advised by Jae Ho Sohn, MD, MS

* **Huawei** (Summer 2020)
SDE intern at Smart Wearable and Sports Health PDU

* **University of Alberta** (Summer 2019)
Heart disease research using statistical machine learning, advised by Prof. Linglong Kong


## Publications

* **Plan, Verify and Switch: Integrated Reasoning with Diverse X-of-Thoughts** [paper]()

**Tengxiao Liu**, Qipeng Guo, Yuqing Yang, Xiangkun Hu, Yue Zhang, Xipeng Qiu, Zheng Zhang

EMNLP, 2023

We find that different prompting methods have formed a great complementarity to each other on reasoning tasks. We propose XoT, an automatic problem solving framework by prompting LLMs with diverse reasoning thoughts. For each question, XoT always begins with selecting the most suitable method then executes each method iteratively. Within each iteration, XoT actively checks the validity of the generated answer and incorporates the feedback from external executors, allowing it to dynamically switch among different prompting methods. We demonstrate the effectiveness of our proposed approach and empirical results suggest that our framework can further generalise to logical reasoning domain. 

* **Full Parameter Fine-tuning for Large Language Models with Limited Resources** [paper](https://arxiv.org/pdf/2306.09782.pdf)

Kai Lv, Yuqing Yang, **Tengxiao Liu**, Qinghui Gao, Qipeng Guo, Xipeng Qiu

Preprint, 2023

We propose a new optimizer, LOw-Memory Optimization (LOMO), which fuses the gradient computation and the parameter update in one step to reduce memory usage. By integrating LOMO with existing memory saving techniques, we reduce memory usage to 10.8% compared to the standard approach (DeepSpeed solution). Consequently, our approach enables the full parameter fine-tuning of a 65B model on a single machine with 8 RTX 3090, each with 24GB memory.

* **RLET: A Reinforcement Learning Based Approach for Explainable QA with Entailment Trees** [paper](https://www.aclanthology.org/2022.emnlp-main.483.pdf)

**Tengxiao Liu**, Qipeng Guo, Xiangkun Hu, Yue Zhang, Xipeng Qiu, Zheng Zhang

EMNLP, 2022

We propose RLET, a Reinforcement Learning based Entailment Tree generation framework, which is trained utilising the cumulative signals across the whole tree. RLET iteratively performs single step reasoning with sentence selection and deduction generation modules, from which the training signal is accumulated across the tree with elaborately designed aligned reward function that is consistent with the evaluation. To the best of our knowledge, we are the first to introduce RL into the entailment tree generation task. Experiments on three settings of the EntailmentBank dataset demonstrate the strength of using RL framework. 

* **Application of a Domain-specific BERT for Detection of Speech Recognition Errors in Radiology Reports** [paper](https://pubmed.ncbi.nlm.nih.gov/35923373/)

Gunvant R. Chaudhari, **Tengxiao Liu**, Timothy L. Chen, Gabby B. Joseph, Maya Vella, Yoo Jin Lee, Thienkhai H. Vu, Youngho Seo, Andreas M. Rauschecker, Charles E. McCulloch, Jae Ho Sohn

Radiology: Artificiall Intelligence, 2022

To develop radiology domain-specific bidirectional encoder representations from transformers (BERT) models that can identify speech recognition (SR) errors and suggest corrections in radiology reports, we propose Radiology BERT. Our Radiology-specific BERT models fine-tuned on generated errors were able to identify SR errors in radiology reports and suggest corrections.


<!-- ## Professional Services
Reviewer for AACL 2022 -->