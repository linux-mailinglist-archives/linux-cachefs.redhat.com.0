Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D244357DED4
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Jul 2022 11:50:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658483433;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GMVQGCcJZ6UfcQlJajwzfebL6qvQOKYDp4D/Zrzo7Yc=;
	b=L81kaNc/VrQsSRCH9IJkdDFc8JnaFXDFOsDTrcY+sG/STX8VdBuSMGfLAyLioGhZpZlXF0
	4ozWfFtkThG2FEseWYCH2cSzHtnDXBq6Q9Sf7B7Bd5MU+3KJ6cIUdhBscQ+jpaBDHLJmS3
	xw4tgkXww678r4qwElfqeu0iGA5BbEs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-3MHbYW4OMOCqSo5EnwtY7g-1; Fri, 22 Jul 2022 05:50:25 -0400
X-MC-Unique: 3MHbYW4OMOCqSo5EnwtY7g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FB3F101A589;
	Fri, 22 Jul 2022 09:50:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7610EC28100;
	Fri, 22 Jul 2022 09:50:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 256CF1947050;
	Fri, 22 Jul 2022 09:50:22 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3FC5F1947049 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 22 Jul 2022 09:50:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2C633400DFD7; Fri, 22 Jul 2022 09:50:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 28B2F40CFD0A
 for <linux-cachefs@redhat.com>; Fri, 22 Jul 2022 09:50:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 111E18037AC
 for <linux-cachefs@redhat.com>; Fri, 22 Jul 2022 09:50:21 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-GbIhRAIaOKmlPL3vSp4fKg-1; Fri, 22 Jul 2022 05:50:17 -0400
X-MC-Unique: GbIhRAIaOKmlPL3vSp4fKg-1
Received: by mail-qk1-f170.google.com with SMTP id e16so3212806qka.5;
 Fri, 22 Jul 2022 02:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=njvi007IPZLoUToBw/3oPRzvfKBBxiE1LtWmOJ0CDkM=;
 b=dj4AZPBcHw3E6+RKya5bZL7ubY1UOEVQZ3742PtTHnbG1AVvJseXYztCFJu+Wxkdv3
 cEls+S4yhF0vUyaT+v4ZS+zzaoi4xe/clYFIW8lhO+YixU8YLwvNdBG4v6v+TpcqJgwr
 PIv/011gmV5107KnTzzIcn3LZ+gvVa6Bj7amJqSXRW2wabybXy9a79dIfMB5c3P+uRgF
 B1C7poibAD0WB7vJ7MJOrz1PbbhwKkZMto5kRvXaqQdbW422jb6C8/J7uf3qFduDl3rQ
 /MMeralhTukT99UxnKuQeEkwEDnuzAR0MVHPfGSxYSrO4aMK10xZg8c5dB6SfBKhUzTG
 2L9w==
X-Gm-Message-State: AJIora/C1T+psLm26erkxqc2jy+2COcQ25hK1zq2Wo897zdJwQnuALu0
 e3uqvXe3Hlo9jjXQbzmBPEBVbmfm71kc2g==
X-Google-Smtp-Source: AGRyM1vOcbkTd8adb1uHccIjEm6jiKLBC36dRD3e9x7SaLITJsRrphAnhC+9lgh47vGnSSdm/O0F1A==
X-Received: by 2002:a05:620a:2710:b0:6b5:bf24:10e9 with SMTP id
 b16-20020a05620a271000b006b5bf2410e9mr1882537qkp.28.1658483404441; 
 Fri, 22 Jul 2022 02:50:04 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179]) by smtp.gmail.com with ESMTPSA id
 j8-20020ac84408000000b0031ee2080c73sm2631344qtn.54.2022.07.22.02.50.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 02:50:04 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id r3so7165049ybr.6;
 Fri, 22 Jul 2022 02:50:04 -0700 (PDT)
X-Received: by 2002:a05:6902:38c:b0:670:b6bc:6ed5 with SMTP id
 f12-20020a056902038c00b00670b6bc6ed5mr2008042ybs.604.1658483065858; Fri, 22
 Jul 2022 02:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220721015605.20651-1-slark_xiao@163.com>
 <20220721154110.fqp7n6f7ij22vayp@kafai-mbp.dhcp.thefacebook.com>
 <21cac0ea.18f.182218041f7.Coremail.slark_xiao@163.com>
 <874jzamhxe.fsf@meer.lwn.net>
 <6ca59494-cc64-d85c-98e8-e9bef2a04c15@infradead.org>
In-Reply-To: <6ca59494-cc64-d85c-98e8-e9bef2a04c15@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 Jul 2022 11:44:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWSCHW4WzXPr95SyAQ3OnMdyO9_PNLAMA_38osV2LMt=Q@mail.gmail.com>
Message-ID: <CAMuHMdWSCHW4WzXPr95SyAQ3OnMdyO9_PNLAMA_38osV2LMt=Q@mail.gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
Cc: linux-cachefs <linux-cachefs@redhat.com>,
 linux-doc <linux-doc@vger.kernel.org>, peterz <peterz@infradead.org>,
 bigeasy <bigeasy@linutronix.de>, ast <ast@kernel.org>, song <song@kernel.org>,
 sdf <sdf@google.com>, will <will@kernel.org>, daniel <daniel@iogearbox.net>,
 Jonathan Corbet <corbet@lwn.net>, "william.gray" <william.gray@linaro.org>,
 "john.fastabend" <john.fastabend@gmail.com>, andrii <andrii@kernel.org>,
 mingo <mingo@redhat.com>, yhs <yhs@fb.com>, dyoung <dyoung@redhat.com>,
 vgoyal <vgoyal@redhat.com>, "boqun.feng" <boqun.feng@gmail.com>,
 kpsingh <kpsingh@kernel.org>, Slark Xiao <slark_xiao@163.com>,
 longman <longman@redhat.com>, tglx <tglx@linutronix.de>,
 haoluo <haoluo@google.com>, Baoquan He <bhe@redhat.com>,
 kexec <kexec@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 jolsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>,
 "martin.lau" <martin.lau@linux.dev>, kafai <kafai@fb.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 21, 2022 at 8:52 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 7/21/22 11:36, Jonathan Corbet wrote:
> > "Slark Xiao" <slark_xiao@163.com> writes:
> >
> >> May I know the maintainer of one subsystem could merge the changes
> >> contains lots of subsystem?  I also know this could be filtered by
> >> grep and sed command, but that patch would have dozens of maintainers
> >> and reviewers.
> >
> > Certainly I don't think I can merge a patch touching 166 files across
> > the tree.  This will need to be broken down by subsystem, and you may
> > well find that there are some maintainers who don't want to deal with
> > this type of minor fix.
>
> We have also seen cases where "the the" should be replaced by "then the"
> or some other pair of words, so some of these changes could fall into
> that category.

Yes we have:

    --- a/arch/m68k/coldfire/intc-2.c
    +++ b/arch/m68k/coldfire/intc-2.c
    @@ -7,7 +7,7 @@
      * family, the 5270, 5271, 5274, 5275, and the 528x family which
have two such
      * controllers, and the 547x and 548x families which have only one of them.
      *
    - * The external 7 fixed interrupts are part the the Edge Port unit of these
    + * The external 7 fixed interrupts are part the Edge Port unit of these
      * ColdFire parts. They can be configured as level or edge triggered.
      *
      * (C) Copyright 2009-2011, Greg Ungerer <gerg@snapgear.com>

And that's already been fixed
https://lore.kernel.org/lkml/6fe2468a-9664-30f7-7f17-9093289eb4b6@linux-m68k.org

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

