Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2668A57FD1D
	for <lists+linux-cachefs@lfdr.de>; Mon, 25 Jul 2022 12:09:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658743792;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZMN2INaODzEPuNi9GPKPM8v3ldaEFXDFbQdVct5vHac=;
	b=WZnEkPH9hIAjjXJ9ylkgyIkHLhKYr2WxVF53V4CGOQGZzbgM/aS5p1Y4AgcV1n4gY3Rrsg
	LeIIvh/kRLQ9OBzcopsv2kZZEptVXhaGaJ8UTxoKzH9PoPqUhLHdMSKtp1q0fahvST/igj
	tJ9P+r5tYDhvr1HavY83bq7lZDP2plk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-NwH_ljylNG-QaSHC_42kWA-1; Mon, 25 Jul 2022 06:09:49 -0400
X-MC-Unique: NwH_ljylNG-QaSHC_42kWA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E8A61824605;
	Mon, 25 Jul 2022 10:09:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7BEB818EB5;
	Mon, 25 Jul 2022 10:09:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6B7311945DB5;
	Mon, 25 Jul 2022 10:09:46 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 543521947040 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 21 Jul 2022 15:43:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3620F141511A; Thu, 21 Jul 2022 15:43:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31B17140EBE3
 for <linux-cachefs@redhat.com>; Thu, 21 Jul 2022 15:43:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1AA1D85A586
 for <linux-cachefs@redhat.com>; Thu, 21 Jul 2022 15:43:21 +0000 (UTC)
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-WBuuL8TNNJ2Y3gvuoTHfgg-1; Thu, 21 Jul 2022 11:43:09 -0400
X-MC-Unique: WBuuL8TNNJ2Y3gvuoTHfgg-1
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LCsALU017692;
 Thu, 21 Jul 2022 08:41:15 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3hf77415y6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 08:41:15 -0700
Received: from MW4PR15MB4475.namprd15.prod.outlook.com (2603:10b6:303:104::16)
 by SJ0PR15MB4171.namprd15.prod.outlook.com (2603:10b6:a03:2ed::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 15:41:14 +0000
Received: from MW4PR15MB4475.namprd15.prod.outlook.com
 ([fe80::a88e:613f:76a7:a5a2]) by MW4PR15MB4475.namprd15.prod.outlook.com
 ([fe80::a88e:613f:76a7:a5a2%9]) with mapi id 15.20.5458.019; Thu, 21 Jul 2022
 15:41:13 +0000
Date: Thu, 21 Jul 2022 08:41:10 -0700
From: Martin KaFai Lau <kafai@fb.com>
To: Slark Xiao <slark_xiao@163.com>
Message-ID: <20220721154110.fqp7n6f7ij22vayp@kafai-mbp.dhcp.thefacebook.com>
References: <20220721015605.20651-1-slark_xiao@163.com>
In-Reply-To: <20220721015605.20651-1-slark_xiao@163.com>
X-ClientProxiedBy: SJ0PR03CA0197.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::22) To MW4PR15MB4475.namprd15.prod.outlook.com
 (2603:10b6:303:104::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64a307c0-99a7-4206-f7c8-08da6b2f714f
X-MS-TrafficTypeDiagnostic: SJ0PR15MB4171:EE_
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: v6da6v6fqHTGTxNkZvzqkdIAn74F3NqYZ5QWtIiSaGTJxfTEtvNuj78nhXDCUpxDe7VXpl2mVvej53ZCQg9QGFMyhngW+hMSj/9MkZUWBUbkoT+WDEjolOYpWfO+Ub8QjYiNALCezBA7W67lQyOj+o2lFGCMnIfNNp6VN+Yg7QGBSym30BpPZADPu5FVWR15rAZ09FKNTve55bzF9EYsk71PjEMcjAEedB4pAZnZezBZgAC+VhHcVe6Hm33VJqR7ycMpVKXw10yjGeXmB4EEssrR0NNAXYKlrsebXtyffj9r7qZEw0df0Bb9e89CNbu1FhA/SrU7y+7I+xSNyQuaZsZiRAq2FzN/oTx13Tjku2EgC4tJJWauIIcliC0ux8StwuUFAwil57NZzM1YIhiI4h8UAQrvNEjrHNHD8VZHWcPbICVBu8Se7DhVx15PducuJ+VN/rdyYriXoPHTa5qMP9+okbf5CCeTyaqh9ArQ51Mo5mJWyLKHqkTVsGMOFNtL4XzybjlAhz/1z9eu6RX4F8KVYTgNNHOyqrho3mzyZndcgmiVM9vBi1LjzBpDSn5B6SD7+ZaQFypVFDJ8fldmYBOG9Ai1knBWbdzhGuMhqt8umXVQApoyo1XX8j3g4NT41qiEN9sLF6U6djzkxMMioYEg/OXxfSEN3OTecKGkL59d0s5f0G1QSomFGzQR0JMYbqHhl4crIb9ad3v/SXLc/mrRmnjpnhya5St1d1bIHFXFQH0Mg/CKkY6Ng+gI/nWD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR15MB4475.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(6486002)(4326008)(316002)(66556008)(66946007)(8676002)(66476007)(1076003)(6916009)(186003)(83380400001)(6506007)(41300700001)(9686003)(86362001)(6512007)(52116002)(478600001)(2906002)(7416002)(5660300002)(8936002)(38100700002);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y50bti7IYrS6TXknATzz2o5HnK7uvWEw4nQWZNQflXsJyW4Qgwr+NWNiSIrn?=
 =?us-ascii?Q?QVGH4eXQIGB5dgB9wjQ/NmNnfrOBmSK286/wJFCcGlITKc51xM98pmelzd/Y?=
 =?us-ascii?Q?zLxBgZFiC1ilpCfh33LJAqGDvzYAsjeXx3TQJq+aOD0lB3AJYRQ03eAzL1dW?=
 =?us-ascii?Q?Gbeqgtx4rDXSf9DoZ33z1drnWubTuqgZJkuI3HThhz+CXviAzFjAAggapdPO?=
 =?us-ascii?Q?bxelLViWoWHGFVS90riswoYUnI2Rb4YEI2zldctfSQKEdVsxKgmX78aZG52G?=
 =?us-ascii?Q?ZoSxrq8+pheXzvu/+uhxvHXn6ivrnN6aH/c1wHiKQhIwPPK66u3iWv7Ffpa8?=
 =?us-ascii?Q?In+C9r6YKM9+nYE2n9V/cuCnd+7wlvtzfGi4aJgKZ2csKbKaMpP4aeYfJhiH?=
 =?us-ascii?Q?asIRp4RoQRUziJScD5CO2siAMqjNI9x7UC5Q5vOartyFR5kjcJjx5VYhdFgB?=
 =?us-ascii?Q?NaDyt/iE89G371MpP7OtPkVtFTZvqmRXRCUcBbV2Vf5Mv1AdjjCXP6ETGCco?=
 =?us-ascii?Q?6ZwerdPS/PJiHT6aLP6vQ5YlSgWlmeXuQ+6VlE5EdwVE5lPYeH/q3dG/XU35?=
 =?us-ascii?Q?1ZS8A6d7gqikvb/Bh6HcBpOcZ99ct7ZE1rTE819p30Xu7H9rhcEMFzV/I/tw?=
 =?us-ascii?Q?W7UMP5D36lO3F2Xt4MfxWFeKCU6fSeckHJAT61TXOR/7pC7GDhWPQbTYiI2T?=
 =?us-ascii?Q?Y2AQDeaXcE/WwpRvh6j5xYdppFgyEKE6qiM+gmfgi97BQfgkYaRqdvvvKLg6?=
 =?us-ascii?Q?S+19QJWypsYGCoqRLCivppYI4BW5uQHsFwGpokRksm3M3V+iuwX6QS1aPsJq?=
 =?us-ascii?Q?u8CNRLDlM4a4Tu5n4cspT2tl8oyaj7VYPBBVqfK4uqS5anbmBdDFtWv9o0Gi?=
 =?us-ascii?Q?TEPiJN13Qq/ZLA5cxn7jGLCCtLeU4sxvZqrwrgvk+cU2cOAo1DDKLhFQg8G0?=
 =?us-ascii?Q?c+zb/+Lpcr8VHYG+y6NdZdLuteygtrjN26TjyC7nzVFlBvvrdXcOwSpAWifY?=
 =?us-ascii?Q?bDXYrk1tQdOeFebrG7kqw+UEEhMEDwYKLt0rAiXIagcThUsQX0AfpPYa14RR?=
 =?us-ascii?Q?JLVxB5LsQZBmLfNONleTTb/teIviM4QY5CDJM11Kh9f9MB7qJuFpb3TjCNFJ?=
 =?us-ascii?Q?IDuj3+it2dPI/tXMD8LHhQDVmFjziofpycEhu7lcMR3td3uljXrPbsZN09KV?=
 =?us-ascii?Q?MxS8Xxkva+LK7jW3pxXaCxqu7swE21dYlOov2eMfmvtAA8vCWwAlJgvknmgN?=
 =?us-ascii?Q?rSFXBlHp/x2pzEb+/agizrIqG7xBUZhviJMJwAJCu16qzILKKxD2972qyHC9?=
 =?us-ascii?Q?9vtRlPKOFsb6EvviIxr3Rgg4a5dQPirduc6cx6B20qXfhs6GJgTZKsXwE3KW?=
 =?us-ascii?Q?Tqco6l8Rn7wPocJtfAkwZef97sEoEJP0w5KIr8yfuGcu7CBndo3pzMGLAzy6?=
 =?us-ascii?Q?53NFvY8hdBH28r8JVVwNY3mxI/1kqsYCCX5pTQqE3gWZuFKKSFu+WWNprQvN?=
 =?us-ascii?Q?kIG3T9p0ELkSUAzLKlEbEvqJhb4KWaIaJbT+QwbzbAzeynf1kiQsIYQR40nW?=
 =?us-ascii?Q?71iFuftSc26YrZBfoEkKIExRnVeb6zN37x9xzWs1pGf0OQyZmG55QRSB9aXL?=
 =?us-ascii?Q?SA=3D=3D?=
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a307c0-99a7-4206-f7c8-08da6b2f714f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR15MB4475.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 15:41:13.8328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4c6jqoGS6MtFsesIccWYXcaM5yTb/ZdpKcykwgEZeh24H4Jhrb87KsuxVf22HhH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4171
X-Proofpoint-GUID: D50t2j6ItDEkUXXW0HIQlceq6v22raip
X-Proofpoint-ORIG-GUID: D50t2j6ItDEkUXXW0HIQlceq6v22raip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_18,2022-07-20_01,2022-06-22_01
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mailman-Approved-At: Mon, 25 Jul 2022 10:09:45 +0000
Subject: Re: [Linux-cachefs] [PATCH v2] docs: Fix typo in comment
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: linux-cachefs@redhat.com, linux-doc@vger.kernel.org, peterz@infradead.org,
 bigeasy@linutronix.de, ast@kernel.org, song@kernel.org, sdf@google.com,
 will@kernel.org, bhe@redhat.com, corbet@lwn.net, william.gray@linaro.org,
 john.fastabend@gmail.com, andrii@kernel.org, mingo@redhat.com,
 longman@redhat.com, dyoung@redhat.com, vgoyal@redhat.com, boqun.feng@gmail.com,
 kpsingh@kernel.org, yhs@fb.com, tglx@linutronix.de, haoluo@google.com,
 daniel@iogearbox.net, kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 jolsa@kernel.org, bpf@vger.kernel.org, martin.lau@linux.dev
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 21, 2022 at 09:56:05AM +0800, Slark Xiao wrote:
> diff --git a/Documentation/bpf/map_cgroup_storage.rst b/Documentation/bpf/map_cgroup_storage.rst
> index cab9543017bf..8e5fe532c07e 100644
> --- a/Documentation/bpf/map_cgroup_storage.rst
> +++ b/Documentation/bpf/map_cgroup_storage.rst
> @@ -31,7 +31,7 @@ The map uses key of type of either ``__u64 cgroup_inode_id`` or
>      };
>  
>  ``cgroup_inode_id`` is the inode id of the cgroup directory.
> -``attach_type`` is the the program's attach type.
> +``attach_type`` is the program's attach type.
>  
>  Linux 5.9 added support for type ``__u64 cgroup_inode_id`` as the key type.
>  When this key type is used, then all attach types of the particular cgroup and
> @@ -155,7 +155,7 @@ However, the BPF program can still only associate with one map of each type
>  ``BPF_MAP_TYPE_CGROUP_STORAGE`` or more than one
>  ``BPF_MAP_TYPE_PERCPU_CGROUP_STORAGE``.
>  
> -In all versions, userspace may use the the attach parameters of cgroup and
> +In all versions, userspace may use the attach parameters of cgroup and
>  attach type pair in ``struct bpf_cgroup_storage_key`` as the key to the BPF map
>  APIs to read or update the storage for a given attachment. For Linux 5.9
>  attach type shared storages, only the first value in the struct, cgroup inode
For the bpf changes,

Acked-by: Martin KaFai Lau <kafai@fb.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

