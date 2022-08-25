Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D195A0723
	for <lists+linux-cachefs@lfdr.de>; Thu, 25 Aug 2022 04:08:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661393319;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MztVaRi2g9qqUP6upHm120QR/6PxojM+kJ2npPstHwM=;
	b=J7J4O9s+1Jti9tlRwjSslmPjnP1I8MS8bbx43sgmoD4+EAjsTG/392W02nxYWokJzwpsOC
	84nBWS1ueNO056LAoJogPCMQLKfKWbgeKUXIv5S1s7L9L2IhM1XqTQZxP3QBU2f+0J+6XJ
	+B7tinNRYLv0KVRWyhkeQOFrA53a0kQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-tBmJH_GUM8aVSs2Od4qfbw-1; Wed, 24 Aug 2022 22:08:36 -0400
X-MC-Unique: tBmJH_GUM8aVSs2Od4qfbw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52299801231;
	Thu, 25 Aug 2022 02:08:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0BA1340CF8EF;
	Thu, 25 Aug 2022 02:08:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1F36F1946A62;
	Thu, 25 Aug 2022 02:08:35 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 316601946A43 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 25 Aug 2022 01:36:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0FD3D2026D64; Thu, 25 Aug 2022 01:36:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C0F02026D4C
 for <linux-cachefs@redhat.com>; Thu, 25 Aug 2022 01:36:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E421F3803908
 for <linux-cachefs@redhat.com>; Thu, 25 Aug 2022 01:36:37 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-467-nHnvzZKbOaS9BttiJzPCjA-1; Wed, 24 Aug 2022 21:36:36 -0400
X-MC-Unique: nHnvzZKbOaS9BttiJzPCjA-1
Received: by mail-lj1-f179.google.com with SMTP id n24so15997376ljc.13
 for <linux-cachefs@redhat.com>; Wed, 24 Aug 2022 18:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=n2DaDKODf/0Jx/YgCGda5jXAYQNmP/PaBJ06ai4Azhs=;
 b=0r5zXlRZ3yrSHPgx0ieR8q6msVI/1c1Ied8v7groBI0hw1HKvb9oog5UsF+Z3vd7Oa
 iiz4Xcv5vHkn4pwtNpkiYxI2FOtcGiFudcnpVFZ+9id9mqazbesj2X5IN4LLe97bfJNi
 duZ2RQaVBjs9coZhNOZjCaF6YLlCI87JaDDciEIZOQuD2KPzl5CMYsBEJfiYE9E4yjVD
 qzUyDVc1PBN+S1jmnSDL53PqNXTf0hheNQ92/aQMWeUey1iRXFXfREkJ54pxYUbydEor
 O0KRZE6YqwVWN44/zaWCqTm751Of3H3a1+0dsG6y6/i7TO/TAOquSU6h4vXyYObRFZ8L
 pk6w==
X-Gm-Message-State: ACgBeo0RAEptgKPz1kOWWcotR3VSJfIu+s0jJO1aEwIHcJ1LYMytxbbO
 iHOuf913tLohVhH/3BliLzKpfj0ojj5pgiK5o9cvIg==
X-Google-Smtp-Source: AA6agR7QA7EhgOcssxsQdsQa443mxRIjyyCiOjL/vJjzUCEcF3h2wC9KL5c4/DQdh+KQC6CIK1SUXfnweApa+RUFvx8=
X-Received: by 2002:a2e:8053:0:b0:261:cf61:c333 with SMTP id
 p19-20020a2e8053000000b00261cf61c333mr468162ljg.297.1661391394774; Wed, 24
 Aug 2022 18:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220817065200.11543-1-yinxin.x@bytedance.com>
 <3713582.1661336736@warthog.procyon.org.uk>
In-Reply-To: <3713582.1661336736@warthog.procyon.org.uk>
From: Xin Yin <yinxin.x@bytedance.com>
Date: Thu, 25 Aug 2022 09:36:18 +0800
Message-ID: <CAK896s4uuU=K5Gau9J79GK_pWQuihyfXUoZCq0iFbWt9fHLudQ@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 24, 2022 at 6:25 PM David Howells <dhowells@redhat.com> wrote:
>
> Xin Yin <yinxin.x@bytedance.com> wrote:
>
> > Reported-by: Yongqing Li <liyongqing@bytedance.com>
> > Signed-off-by: Xin Yin <yinxin.x@bytedance.com>
>
> Can you give me a Fixes: line please?
>
Sure , I will send a V2 patch and add the Fixes line.

Thanks
Xin Yin

> David
>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

