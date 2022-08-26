Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A49E5A1E41
	for <lists+linux-cachefs@lfdr.de>; Fri, 26 Aug 2022 03:37:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661477860;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/NfHROFctExdLt+AP6kZTQ/Hlx3WD1tD32gZsgCBPTQ=;
	b=L83Nv91DLjH6x7Q1iXTF6TPmQHTWeXwhleEJV4WLHotXZrcoskdpc0k3WW40BfV+8wqu1S
	jasAYrk/uc/Pk3B/HmCe2wcJt2tmaiNZUQxzcCktjYBZR/cB4mzEjVrCXGVPgJk0Nflhhk
	QiQAJ76YipOP/1/hru3h2Qq5kDUXyOA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-T4v1Yq5vPBOlz9MryqOt0w-1; Thu, 25 Aug 2022 21:37:37 -0400
X-MC-Unique: T4v1Yq5vPBOlz9MryqOt0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87E2118E0043;
	Fri, 26 Aug 2022 01:37:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E046141510F;
	Fri, 26 Aug 2022 01:37:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 584C01946A58;
	Fri, 26 Aug 2022 01:37:36 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3017F1946A43 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 26 Aug 2022 01:37:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0844C2026D64; Fri, 26 Aug 2022 01:37:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 048782026D4C
 for <linux-cachefs@redhat.com>; Fri, 26 Aug 2022 01:37:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDC8880A0AE
 for <linux-cachefs@redhat.com>; Fri, 26 Aug 2022 01:37:34 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-p2kh5bV8OuiZHfYdkLU0MA-1; Thu, 25 Aug 2022 21:37:33 -0400
X-MC-Unique: p2kh5bV8OuiZHfYdkLU0MA-1
Received: by mail-lf1-f48.google.com with SMTP id n15so164804lfe.3
 for <linux-cachefs@redhat.com>; Thu, 25 Aug 2022 18:37:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=GKNQ/ICM71YlRfPoSJ/fDt8fKEwvuPRl/SEMWxgkQ9I=;
 b=JLSHTpmn1fyMAvrP8+gkgbgF5Hsg4PrBFkHehrfr52k+wWmhE+rRNa41UoF1WaPhG2
 Q2QA3EMWSj52ooqMbpGPMmyEhT3V8ikBJRlKhKjA0wz/dQdvagy0vXeGTEppxyuW9Xgl
 JkF5Yoa8j0q0wZSPrTxMG1IqW8jMmn6HD2IWpdWzFG0wZ5XkXvUaWaJWde/W1AK3ak3K
 1FOhtNa7KP7j3apHHhb2hEstRmc7vPvsVStSO33RCKAEO/NJQRXYC9nSMjEB+YUex06g
 Msn6W+ewtwusDRhHSPbWOjmOxWW+bKuWo/JyN0Xhhs6zuBnAJEMmS0m/j3xxXLiH7xzl
 fL0Q==
X-Gm-Message-State: ACgBeo19z+edVYQ4UrucUITYgFlXGMFIH5AVM4d0UK8X7ujFdn/qP7iA
 nRf3Fj9qo+YGz0kaV54s6bwUW1NGqxdrBX7x5C146w==
X-Google-Smtp-Source: AA6agR4AR6FyNb5iDfumWDUQyjoEAmPVsHwBUrXQ5m1yUa65MpdySD9fBoYVkGEA8ehm6LQvnSPqL/zfpT2Py88xr+w=
X-Received: by 2002:a19:5e02:0:b0:48b:1870:dc4 with SMTP id
 s2-20020a195e02000000b0048b18700dc4mr2002932lfb.4.1661477851560; Thu, 25 Aug
 2022 18:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220817065200.11543-1-yinxin.x@bytedance.com>
 <3713582.1661336736@warthog.procyon.org.uk>
 <CAK896s4uuU=K5Gau9J79GK_pWQuihyfXUoZCq0iFbWt9fHLudQ@mail.gmail.com>
 <3791693.1661438076@warthog.procyon.org.uk>
In-Reply-To: <3791693.1661438076@warthog.procyon.org.uk>
From: Xin Yin <yinxin.x@bytedance.com>
Date: Fri, 26 Aug 2022 09:37:12 +0800
Message-ID: <CAK896s6E_u34XKF6zCu9ecYCRs6_Po=po=0npnHRp+b6wWn7Uw@mail.gmail.com>
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
Cc: Yongqing Li <liyongqing@bytedance.com>, linux-fsdevel@vger.kernel.org,
 linux-cachefs@redhat.com, xiang@kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 25, 2022 at 10:34 PM David Howells <dhowells@redhat.com> wrote:
>
> Xin Yin <yinxin.x@bytedance.com> wrote:
>
> > > Can you give me a Fixes: line please?
> > >
> > Sure , I will send a V2 patch and add the Fixes line.
>
> Just giving me a Fixes line would do.  I can insert it.
>

Yeah, many thanks , the fixes line would be:
Fixes: c8383054506c ("cachefiles: notify the user daemon when looking
up cookie")

Thanks,
Xin Yin

> David
>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

