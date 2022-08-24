Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BC46859F848
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 Aug 2022 13:00:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661338830;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7NuLc3wS3aLUxZK7KBd+QKBsg/sTMkfBD1q029HNNhA=;
	b=eudeiMUpn9SV7yqfXHpsqqIs3AG7pFJ5r9YCz7zbmzC6HuSTFmIq7ndXH4L1exvGS7lY5/
	RLfAKfKG0ZiqUBVLnYVHV8cPtUaA1kX239tkTzJ0tX+3H2oiFqu27WYHFoIA14rDBZJojK
	SjbnTs1u4If4Ec8VQ2023yYT246cxyg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-fXb7ajRnOZebKAdDbB3xig-1; Wed, 24 Aug 2022 07:00:29 -0400
X-MC-Unique: fXb7ajRnOZebKAdDbB3xig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5BD2294EDEB;
	Wed, 24 Aug 2022 11:00:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9A13B4010FA1;
	Wed, 24 Aug 2022 11:00:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 652221946A52;
	Wed, 24 Aug 2022 11:00:28 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9903B1946A42 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 24 Aug 2022 11:00:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4337A1121319; Wed, 24 Aug 2022 11:00:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EC3B1121315
 for <linux-cachefs@redhat.com>; Wed, 24 Aug 2022 11:00:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 171A11C07550
 for <linux-cachefs@redhat.com>; Wed, 24 Aug 2022 11:00:27 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-134-nVTorp20PkOuOM9jK-A3QQ-1; Wed, 24 Aug 2022 07:00:24 -0400
X-MC-Unique: nVTorp20PkOuOM9jK-A3QQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=hsiangkao@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VN7IkSi_1661338808
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0VN7IkSi_1661338808) by smtp.aliyun-inc.com;
 Wed, 24 Aug 2022 19:00:10 +0800
Date: Wed, 24 Aug 2022 19:00:08 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <YwYEuLju8hixxMZT@B-P7TQMD6M-0146.local>
Mail-Followup-To: David Howells <dhowells@redhat.com>,
 Xin Yin <yinxin.x@bytedance.com>, xiang@kernel.org,
 jefflexu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
 zhujia.zj@bytedance.com, linux-cachefs@redhat.com,
 Yongqing Li <liyongqing@bytedance.com>
References: <Yvy2LWrMMktWPAdk@B-P7TQMD6M-0146.local>
 <20220817065200.11543-1-yinxin.x@bytedance.com>
 <YvyVOfzkITlvgtQ6@B-P7TQMD6M-0146.local>
 <CAK896s71E8a_iAYwEtzp7XKopQnVT5-YnkuC3yTewOfdmvf2VQ@mail.gmail.com>
 <3711027.1661336669@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <3711027.1661336669@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: Re: [Linux-cachefs] [External] Re: [PATCH] cachefiles: make
 on-demand request distribution fairer
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
Cc: zhujia.zj@bytedance.com, Yongqing Li <liyongqing@bytedance.com>,
 linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com, xiang@kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi David,

On Wed, Aug 24, 2022 at 11:24:29AM +0100, David Howells wrote:
> Gao Xiang <hsiangkao@linux.alibaba.com> wrote:
> 
> > If David is fine with "req_id_next", I'm okay with that as well.
> 
> I can live with it.
> 
> Did you want to give me an R-b line?

Yeah, thanks, much appreciated!  As far as I know, such unfairness can
cause starvation in Bytedance's test environment, it would be better
to fix it as above.

Thanks,
Gao Xiang

> 
> David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

