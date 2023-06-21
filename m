Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 25948738C61
	for <lists+linux-cachefs@lfdr.de>; Wed, 21 Jun 2023 18:53:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687366430;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=LyObQqepsrbo2oX6XHpoWHhGGSucNhJ10qQh/Q+kJUo=;
	b=Gm6kxmSWP0VPjvj3gii4AkUfl1siBm2VIpsBvNlC46juCpAmMeeNK488neM7FacnEybLSZ
	XAicIHYx8pW14ge/zqNFMAhvldnMyGaex6naEFrSXDjKsE0XhNkkUgI02/IGdlJ2G4aHyP
	5dadxr+uyBd6/D+vlaaVfjJ5QeOeTac=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-C-QFd7PkN2SYQ4Xh79DpoQ-1; Wed, 21 Jun 2023 12:53:48 -0400
X-MC-Unique: C-QFd7PkN2SYQ4Xh79DpoQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88991870F03;
	Wed, 21 Jun 2023 16:53:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C269540C2063;
	Wed, 21 Jun 2023 16:53:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1A4C2194658C;
	Wed, 21 Jun 2023 16:53:41 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2A374194658D for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 21 Jun 2023 13:06:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 22B1E425357; Wed, 21 Jun 2023 13:06:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AE99425356
 for <linux-cachefs@redhat.com>; Wed, 21 Jun 2023 13:06:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EACF28870DE
 for <linux-cachefs@redhat.com>; Wed, 21 Jun 2023 13:06:25 +0000 (UTC)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-ymfhq7mANcWO4exo5NmvUA-1; Wed, 21 Jun 2023 09:06:24 -0400
X-MC-Unique: ymfhq7mANcWO4exo5NmvUA-1
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230621130618euoutp029064a17d1e909129860c2967cf88b763~qrmmZm0i81313413134euoutp02z;
 Wed, 21 Jun 2023 13:06:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230621130618euoutp029064a17d1e909129860c2967cf88b763~qrmmZm0i81313413134euoutp02z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1687352779;
 bh=tF4riIzozstFHcZHBtz5SQAzztgzSEi85C6+BMxI57A=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=KizIn4h/+VubKpimOPqcdjHWTOSNrdxhq52NIdlcN6uvcXLAB6nFiyBh7t4SmSiCP
 td604+vg7J45oRN7XVDY0MruktIM6Tfp+rbOoX3PpG3N0t8hckrvJWga2W8NV3jyeY
 H1l5Lg0B87tZSR6VD/1dW5vkoQMqYyIu+p+NXDVs=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230621130618eucas1p26bebad0290381b6c6cb4bc9b27d122f5~qrml9OciK0200302003eucas1p2H;
 Wed, 21 Jun 2023 13:06:18 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 94.F5.42423.AC5F2946; Wed, 21
 Jun 2023 14:06:18 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230621130617eucas1p2d418f189352fca58d3547c0b3c4e2078~qrmlH_Wmx0598905989eucas1p2M;
 Wed, 21 Jun 2023 13:06:17 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230621130617eusmtrp1deec7a7753b1b8a355f9dfe83f8704bb~qrmlF-M1k0740407404eusmtrp1I;
 Wed, 21 Jun 2023 13:06:17 +0000 (GMT)
X-AuditID: cbfec7f2-a3bff7000002a5b7-83-6492f5ca7091
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id F1.B8.14344.9C5F2946; Wed, 21
 Jun 2023 14:06:17 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230621130616eusmtip17e21dd5f7eca1289642f50e5db94443d~qrmkf0BdK0234302343eusmtip1d;
 Wed, 21 Jun 2023 13:06:16 +0000 (GMT)
Received: from localhost (106.210.248.248) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 21 Jun 2023 14:06:15 +0100
Date: Wed, 21 Jun 2023 15:06:14 +0200
From: Joel Granados <j.granados@samsung.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <20230621130614.s36w4u7dzmb5d5p3@localhost>
MIME-Version: 1.0
In-Reply-To: <87o7l92hg8.fsf@intel.com>
X-Originating-IP: [106.210.248.248]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA2WTe0wUVxTGc2dmZxYsmxGJXhFCimJbQeqjjUeRpk20mTaNscRgrIl1A6No
 EcyutEhr5CmUgsjykkfl6WJ57ALlvUArwsqCtSKUAorAgkEEedWlvLcLg61J/7n5ne+c797v
 /HHFpGWq2Fp8xucCL/ORetvT5lS5dvb+9maDwnNH8721UNwyTEOauoCGsCojBUHaDBEsKrQM
 vJx9xEDkUikFA4v1NDwc+IOGpOEgCsaVUQgeK4YYMPYMEZDT1E+ARjVGwGJVOAnG8lgSsjOn
 SXhWFI6gLrTEdFwvpGEseJ6CtkEJqKrDCCisWSDhe72RhvGQExCSraaho4KDkRt5CELKDAgS
 izdAu3KChqzOcgLSunbBrDKPAd39aQp6DXoKVOpsAoIrbxHQEJ9Cwk/KGQZ6YhIoSI4MMQVq
 MRBQ9jiYhqG6aAIelF8VwWB+GQPxczdJuNa8E0oGOkQwmdPMQO+TWQJqanWUKUIPAQmxplfD
 I9IQPM0YEcGvtekIqhcqGahPqEUw//eSCPTqceJDT653dJHiCm4UIK6to5Xk5ucUiOvWG0gu
 NbCV4gxd9wlubnYb97TVjYsNGWO42ukMiqtK6WG4jBI/rkNzjFuoL2a46uog5vDuL8z3e/Le
 Z77mZe9+cNLcK1V9hTzfZO+vbdMQgajYJhKZiTH7Hp54qqQjkbnYkr2FsC6rkBGKlwjfDu4j
 heIvhOeNV9ErS7E+VyQ0chHuL60j/p1qnKlZtZQhrG+JW7FQrAOeiUkQLTPNOuHfRx+Ty2zF
 bseFnYMrV5Hsw704vKRhxbCOdcOhWRHMMluwe/DNqWAk8FqsSx6klplk/bGq/zfTjNjEm3Du
 knhZNmPfwlVDi5QQdTP+sy6bFvgSbi7tXkmK2a43cGSlYrVxAOeP9TMCr8PP75ausg1uiYui
 BEMcwr8sTTBCkY+wMshACFMuOLR9cNXxEW7KaqSXE2FWgjtfrBWCSrCiPIkUZAscccVSmN6K
 85+MUtfQ5pTXVkt5bbWU/1YTZCecoZmi/yc7YmXmCCmwK1apxqkMxOShDbyf/NxpXr7Th//G
 WS49J/fzOe3s4XuuBJn+bMvS3alK9OPzSed6RIhRPdpiMuuL8h8ga8rH14e3t7KwLVF4Wlp4
 Si8G8DLfL2V+3ry8Hm0SU/YbLBxddR6W7GnpBf4rnj/Py151CbGZdSCxw6M6nzLqTk5PFfzw
 IMH9M8O3Cwed1vnGi467N2okI0XGGLuRng4uxx/bWe7f6uwq6hq2s753OX14fVFc8ttdz/eE
 3kk9dej8M2NH3O0+Zbrv2aiKg1WxbvtkDVYvjnd/jEivn4ef6V2MeTh6fVSQZ6V3MrYlT7RP
 v5hs2Gsd/WhNaOGmpLzuT6aptGtndUfVcv/rY66Sd2IcuS1RsjDpkUvvBzSWLiR4gLo97fLG
 xIu5FVoXDWnm0Lxxt5Z0P6vplBxQJUmcv0uttg090hW5L/7zOw44Zs2puU/DKgIiWrcePmbN
 28xrsvrueEV5SMqOpu/KfHPqUKlrk3a4KjHcrq3XnpJ7SXduI2Vy6T9p9zyTLgUAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA2WTfUxTZxTG9957e1s0aAcS7hB16eZgqIWilYMB5zI0Fzc30bklbgKd3KEb
 tKQFMnGaIjC1+AF1KgNC/CoIlEJZqzL8CkIpgwEq8m02oA75GBWhOMTCbm2WmeyfN7/3Oed5
 ct43OTzc7SrXi7dXmsjIpZI4ATmPaJytf7iqwaaOCRjt5YO+cYgEc8cFDPLLtSTUKIOgVVeK
 4NlMHg7Vj3sIyKiaI6Cq0sCBVNM5DtjVJi5MTvdwQTVrIODJoQwctIZUDAbsNSRMVMyyR209
 CSN3niIwa9m+ewMPSDg7lEpA/lATF6yFxxD0qge5MPdwEINL5j4MprSdGFTrxjCwVx3GYaJv
 kANzV7JxuHh+CofHFYcR5LekE2DvyCThZnolgps5ZSSMHZoh4FGWEYf7lgXQZrOSoPslA2Ot
 6Vwou/4Ch0emfi4c7Z8j4cpx9lXWtEhozZ3iQNrFchLar9JQU3+LCyMFJQgyh70hzWhDcEbv
 CXlZP2NgOdnPgbyzaRhoeo5yoK3wCQlF98sRqKez0IY6RN9v+5B+lnGCoH8ftRO0tkDLSu13
 cXrmuRrR3f02nB5rbkB0gXY/nas8TtJ5yrsEfa72I9rW1YzRz6f9aENxF0Zn1g7jW3fsFIbI
 ZUmJzJt7ZIrEUMEXIggUioJBGLgmWChaHbRrXaBY4L8+JIaJ25vMyP3XRwv3nO68jCWYBN91
 T5/nKFG5twq58Cj+GkrfX8RxsBtfg6gJa6hT96b0kw84TnanXrSrSBWax/aMI6qoqRZ3XoyI
 OlGS/7KL4C+n/j55+iWT/JVUy2gv7uBF/FVUWaeF4zDg/OZgKv2vNtJRcOdvo9IvHOE62JUf
 RGmeHkLO1D8QZb3QQjgLr1MNP1leMs5PpjJum1kDj+XFVNEszyG78H2oqkE74Rz1Larj5kXS
 yQeoCfufKAu5576SlPtKUu5/SU7Zj+qcHcL+J6+gCs+P4E4OpXQ6K3EOcUvQIiZJER8brwgU
 KiTxiiRprHC3LL4SsVtzxTRtuIaKh8eFNQjjoRr0NuvsryhtRV6EVCZlBItcl1SqY9xcYyT7
 Uhi5LEqeFMcoapCY/cZs3Mtjt4xdQWlilGhtgFi0Zm1wgDh47WqBp2t4whGJGz9Wksh8yzAJ
 jPxfH8Zz8VJiZ2NX1RkPLqyOXNKOKbsT7kUdOJwaOhM9aXEJ8857tkw8lSneeKbn1MSNhI/D
 l3oOPaxuCesMMPXuPO5htjARme8ZePuCLlvMn260Dezvur1yV6NldPhSdruvWr8dK530/PHX
 z0QnIlWGkXe//+COPmWpz5YNIz7vNH0dqqnWbt6eY/d/v2/plorxH5BdMb+A52lYn+aLfOoC
 Dm5+7vs4hZzu8NKE6D9ZybW+SNXcuEYujvLDVcc8Dp65Zp/8MqkgYr7RNNAcrZPOdhm/Kba8
 tqwvWpAT3lq+YPGKTEtYRFiZ56n8dePLF5Ra3riu3NbB2Vq/adOOhbyJ5N/EOU2f33pQvuWr
 KAGh2CMR+eFyheQfqa/esMoEAAA=
X-CMS-MailID: 20230621130617eucas1p2d418f189352fca58d3547c0b3c4e2078
X-Msg-Generator: CA
X-RootMTR: 20230621094824eucas1p2b6adfbd3f15ff3665674917f419b25d3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230621094824eucas1p2b6adfbd3f15ff3665674917f419b25d3
References: <20230621091000.424843-1-j.granados@samsung.com>
 <CGME20230621094824eucas1p2b6adfbd3f15ff3665674917f419b25d3@eucas1p2.samsung.com>
 <20230621094817.433842-1-j.granados@samsung.com> <87o7l92hg8.fsf@intel.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Wed, 21 Jun 2023 16:53:40 +0000
Subject: Re: [Linux-cachefs] [PATCH 09/11] sysctl: Remove the end element in
 sysctl table arrays
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Miaohe Lin <linmiaohe@huawei.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 Ben Segall <bsegall@google.com>, linux-sctp@vger.kernel.org,
 ocfs2-devel@oss.oracle.com, Miquel Raynal <miquel.raynal@bootlin.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stefan Schmidt <stefan@datenfreihafen.org>, Wei Liu <wei.liu@kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>, bridge@lists.linux-foundation.org,
 James Morris <jmorris@namei.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Eric Biggers <ebiggers@kernel.org>,
 linux-cachefs@redhat.com, Mel Gorman <mgorman@suse.de>, "Darrick J.
 Wong" <djwong@kernel.org>, Waiman Long <longman@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Petr Mladek <pmladek@suse.com>, Martin Schiller <ms@dev.tdt.de>,
 Russ Weight <russell.h.weight@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 John Ogness <john.ogness@linutronix.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Remi Denis-Courmont <courmisch@gmail.com>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anton Altaparmakov <anton@tuxera.com>, Christian Brauner <brauner@kernel.org>,
 Will Drewry <wad@chromium.org>, Neil Horman <nhorman@tuxdriver.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, mcgrof@kernel.org,
 Chuck Lever <chuck.lever@oracle.com>, netfilter-devel@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 linux-fsdevel@vger.kernel.org, Matthieu Baerts <matthieu.baerts@tessares.net>,
 Andrew Morton <akpm@linux-foundation.org>, linux-trace-kernel@vger.kernel.org,
 linux-wpan@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
 linux-aio@kvack.org, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, linux-ia64@vger.kernel.org,
 Naoya Horiguchi <naoya.horiguchi@nec.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Clemens Ladisch <clemens@ladisch.de>, Phillip Potter <phil@philpotter.co.uk>,
 Song Liu <song@kernel.org>, Eric Dumazet <edumazet@google.com>,
 keyrings@vger.kernel.org, John Stultz <jstultz@google.com>,
 Stanislav Fomichev <sdf@google.com>, Jan Karcher <jaka@linux.ibm.com>,
 codalist@telemann.coda.cs.cmu.edu, linux-s390@vger.kernel.org,
 Valentin Schneider <vschneid@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Corey Minyard <minyard@acm.org>,
 Leon Romanovsky <leon@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Will Deacon <will@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Mat Martineau <martineau@kernel.org>, Matthew Bobrowski <repnop@google.com>,
 Julian Anastasov <ja@ssi.bg>, coreteam@netfilter.org,
 Roopa Prabhu <roopa@nvidia.com>, Yonghong Song <yhs@fb.com>,
 Iurii Zaikin <yzaikin@google.com>, Sven Schnelle <svens@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Mike Travis <mike.travis@hpe.com>,
 Wenjia Zhang <wenjia@linux.ibm.com>, Simon Horman <horms@verge.net.au>,
 Xin Long <lucien.xin@gmail.com>, linux-arm-kernel@lists.infradead.org,
 fsverity@lists.linux.dev, Hao Luo <haoluo@google.com>,
 Theodore Ts'o <tytso@mit.edu>, Stephen Boyd <sboyd@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, Florian Westphal <fw@strlen.de>,
 Robin Holt <robinmholt@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Jon Maloy <jmaloy@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Eric Biederman <ebiederm@xmission.com>, Anna Schumaker <anna@kernel.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-hams@vger.kernel.org,
 Nikolay Aleksandrov <razor@blackwall.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Alexei Starovoitov <ast@kernel.org>, Marc Dionne <marc.dionne@auristor.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-afs@lists.infradead.org,
 Daniel Borkmann <daniel@iogearbox.net>, linux-rdma@vger.kernel.org,
 Dexuan Cui <decui@microsoft.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, lvs-devel@vger.kernel.org,
 coda@cs.cmu.edu, Doug Gilbert <dgilbert@interlog.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Paolo Abeni <pabeni@redhat.com>, Pablo Neira Ayuso <pablo@netfilter.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Haiyang Zhang <haiyangz@microsoft.com>,
 intel-gfx@lists.freedesktop.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-crypto@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 openipmi-developer@lists.sourceforge.net, mptcp@lists.linux.dev,
 Jan Harkes <jaharkes@cs.cmu.edu>, linux-nfs@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mm@kvack.org,
 Jeff Layton <jlayton@kernel.org>, Andy Lutomirski <luto@amacapital.net>,
 linux-xfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 netdev@vger.kernel.org, Ying Xue <ying.xue@windriver.com>, bpf@vger.kernel.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Alexander Aring <alex.aring@gmail.com>, Jan Kara <jack@suse.cz>,
 Steve Wahl <steve.wahl@hpe.com>, Peter Zijlstra <peterz@infradead.org>,
 Balbir Singh <bsingharora@gmail.com>, Amir Goldstein <amir73il@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 "H. Peter Anvin" <hpa@zytor.com>, David Airlie <airlied@gmail.com>,
 Steffen Klassert <steffen.klassert@secunet.com>, rds-devel@oss.oracle.com,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org,
 dccp@vger.kernel.org, Mark Fasheh <mark@fasheh.com>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>, "James
 E.J. Bottomley" <jejb@linux.ibm.com>, Joerg Reuter <jreuter@yaina.de>,
 linux-hyperv@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>, apparmor@lists.ubuntu.com,
 linux-raid@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 Juergen Gross <jgross@suse.com>, John Johansen <john.johansen@canonical.com>,
 linux-x25@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 David Ahern <dsahern@kernel.org>, kexec@lists.infradead.org,
 linux-security-module@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>,
 tipc-discussion@lists.sourceforge.net, Daniel Vetter <daniel@ffwll.ch>,
 Martin KaFai Lau <martin.lau@linux.dev>, Karsten Graul <kgraul@linux.ibm.com>,
 Joel Becker <jlbec@evilplan.org>
Content-Type: multipart/mixed; boundary="===============4492584892682473762=="
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1

--===============4492584892682473762==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="avrt2cz7yepdubk6"
Content-Disposition: inline

--avrt2cz7yepdubk6
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2023 at 02:16:55PM +0300, Jani Nikula wrote:
> On Wed, 21 Jun 2023, Joel Granados <j.granados@samsung.com> wrote:
> > Remove the empty end element from all the arrays that are passed to the
> > register sysctl calls. In some files this means reducing the explicit
> > array size by one. Also make sure that we are using the size in
> > ctl_table_header instead of evaluating the .procname element.
>=20
> Where's the harm in removing the end elements driver by driver? This is
> an unwieldy patch to handle.

I totally agree. Its a big one!!! but I'm concerned of breaking bisectibili=
ty:
* I could for example separate all the removes into separate commits and
  then have a final commit that removes the check for the empty element.
  But this will leave the tree in a state where the for loop will have
  undefined behavior when it looks for the empty end element. It might
  or might not work (probably not :) until the final commit where I fix
  that.

* I could also change the logic that looks for the final element,
  commit that first and then remove the empty element one commit per
  driver after that. But then for all the arrays that still have an
  empty element, there would again be undefined behavior as it would
  think that the last element is valid (when it is really the sentinel).

Any ideas on how to get around these?
>=20
> > diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i9=
15_perf.c
> > index f43950219ffc..e4d7372afb10 100644
> > --- a/drivers/gpu/drm/i915/i915_perf.c
> > +++ b/drivers/gpu/drm/i915/i915_perf.c
> > @@ -4884,24 +4884,23 @@ int i915_perf_remove_config_ioctl(struct drm_de=
vice *dev, void *data,
> > =20
> >  static struct ctl_table oa_table[] =3D {
> >  	{
> > -	 .procname =3D "perf_stream_paranoid",
> > -	 .data =3D &i915_perf_stream_paranoid,
> > -	 .maxlen =3D sizeof(i915_perf_stream_paranoid),
> > -	 .mode =3D 0644,
> > -	 .proc_handler =3D proc_dointvec_minmax,
> > -	 .extra1 =3D SYSCTL_ZERO,
> > -	 .extra2 =3D SYSCTL_ONE,
> > -	 },
> > +		.procname =3D "perf_stream_paranoid",
> > +		.data =3D &i915_perf_stream_paranoid,
> > +		.maxlen =3D sizeof(i915_perf_stream_paranoid),
> > +		.mode =3D 0644,
> > +		.proc_handler =3D proc_dointvec_minmax,
> > +		.extra1 =3D SYSCTL_ZERO,
> > +		.extra2 =3D SYSCTL_ONE,
> > +	},
> >  	{
> > -	 .procname =3D "oa_max_sample_rate",
> > -	 .data =3D &i915_oa_max_sample_rate,
> > -	 .maxlen =3D sizeof(i915_oa_max_sample_rate),
> > -	 .mode =3D 0644,
> > -	 .proc_handler =3D proc_dointvec_minmax,
> > -	 .extra1 =3D SYSCTL_ZERO,
> > -	 .extra2 =3D &oa_sample_rate_hard_limit,
> > -	 },
> > -	{}
> > +		.procname =3D "oa_max_sample_rate",
> > +		.data =3D &i915_oa_max_sample_rate,
> > +		.maxlen =3D sizeof(i915_oa_max_sample_rate),
> > +		.mode =3D 0644,
> > +		.proc_handler =3D proc_dointvec_minmax,
> > +		.extra1 =3D SYSCTL_ZERO,
> > +		.extra2 =3D &oa_sample_rate_hard_limit,
> > +	}
> >  };
>=20
> The existing indentation is off, but fixing it doesn't really belong in
> this patch.

Agreed. But I actually was trying to fix something that checkpatch
flagged. I'll change these back (which will cause this patch to be
flagged).

An alternative solution would be to fix the indentation as part of the
preparation patches. Tell me what you think.

Thx

>=20
> BR,
> Jani.
>=20
>=20
> --=20
> Jani Nikula, Intel Open Source Graphics Center

--=20

Joel Granados

--avrt2cz7yepdubk6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmSS9cQACgkQupfNUreW
QU/tWQv+LHqhRfLnActmTK06NicBnR3PUYRIMank4jSVG6jtvqu/VBMNmvKyRaeA
68kGzzIEbayPbBOL1M2GmrBgIaWp9OIWt4jKQeY4ARm9DcL2FWqUqLufGoPlwjX/
0GFjsIlBykddf6c3149Hf7D2Xz+hZyF8GgqMaIuty4hcNbIoeYs5zmwPaQmn+/q0
eoe07uBOs32ocQPIMJuRPMw6KSxHYOiWbNHxgQlIl7stObKOuvQXO2GLDgqHc13y
NKMTC6XNh4VAc7JHtrsEVEBiVro3IGh7cS5U5DK0jhlSLsRfJUkXmSO4H9EwGLBq
mWAl5Qr+YGnCrfE6jGc7uTM0etzscRGIlKIJ+7qcLgSfVgkqYeb5AmkZ8bvailD8
h66rr3XzwBKiQRaXpk6V7/IliqJcG7+N2yGsGJ3UXpvoF/1ieeb39kcSOFZ75BU5
USV/t5Fj0VqHetwv6dC5A8RLktlHNQZcTAXJkLL0QZ5xrmWC9kiIJ/EzJnCgJlSu
AwkfgT+P
=LLXc
-----END PGP SIGNATURE-----

--avrt2cz7yepdubk6--


--===============4492584892682473762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

--===============4492584892682473762==--

