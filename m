Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7202D46F863
	for <lists+linux-cachefs@lfdr.de>; Fri, 10 Dec 2021 02:20:24 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-up_VT7_BONi2cXBMXC-BKw-1; Thu, 09 Dec 2021 20:20:20 -0500
X-MC-Unique: up_VT7_BONi2cXBMXC-BKw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EC6E1006AA2;
	Fri, 10 Dec 2021 01:20:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C36F810074FD;
	Fri, 10 Dec 2021 01:20:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C0794BB7C;
	Fri, 10 Dec 2021 01:20:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BA1KDFq026913 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 9 Dec 2021 20:20:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E8CC9401DBD; Fri, 10 Dec 2021 01:20:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E53A2401DB1
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 01:20:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB02885A5AA
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 01:20:12 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
	[209.85.222.179]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-572-wLYA00ebOFyUjAAoG8me1Q-1; Thu, 09 Dec 2021 20:20:11 -0500
X-MC-Unique: wLYA00ebOFyUjAAoG8me1Q-1
Received: by mail-qk1-f179.google.com with SMTP id de30so6585471qkb.0;
	Thu, 09 Dec 2021 17:20:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=E21fiaL89lo4s80Dd5ii4XZUAZScAir+7D/5kVfVX38=;
	b=NwfEfu9n7/kSTdPe3slfVbZ90tpsbnWEjXopYAAcAakwSzA1eTYjMGhogq5Nth6blk
	RkYsH8GBPTgh9bgaBszOyMWjXeEK61NB/M6bkvsHmbxaqbP6QgKRJiMMTIwn7CffQ3b5
	WqhHznYN6pWsYkDlaWkPViYttcjNxMnu4g59+UBo/rVdGvEOasT+QaTz+BYXUJSwuaT/
	YEp92UIPZxtDyt8lGzP1Og5PKRy5V1iLxAkx6EUMQupQW6NI6cAg0n2WwVQppV+GTPkF
	dI8qlSoUfocuPvyH6NtmPGMTzAQPCKyjVNXhKhi9FSTaciGCKdFXE6V1LXs+Xek3FykJ
	GtzQ==
X-Gm-Message-State: AOAM531SwtCp062a0A12zGTlYE+RT/FioutO+A+Hx/9xkb3V6d6oE10d
	VtgecLLw9EeZvaYMtQcnRm0fGe54662xfZH6rUTm3azmQGYC6w==
X-Google-Smtp-Source: ABdhPJy7V2QnpcJ3Eb+OTiWtoQ0lK7fyfojgG2YB6/22nOPTv6HTzhiVYf8DDFCMK0a5h2JW/6pXECWsJHf1m+I5uNM=
X-Received: by 2002:a05:620a:1924:: with SMTP id
	bj36mr17821101qkb.476.1639099210545; 
	Thu, 09 Dec 2021 17:20:10 -0800 (PST)
MIME-Version: 1.0
References: <1638952658-20285-1-git-send-email-huangzhaoyang@gmail.com>
	<2868725.1638995206@warthog.procyon.org.uk>
In-Reply-To: <2868725.1638995206@warthog.procyon.org.uk>
From: Zhaoyang Huang <huangzhaoyang@gmail.com>
Date: Fri, 10 Dec 2021 09:19:50 +0800
Message-ID: <CAGWkznHcuiwPPMZE95nYG=EFkM8NmLUQZooS5+a+GigP50qksg@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: linux-cachefs@redhat.com
Cc: Marc Dionne <marc.dionne@auristor.com>, linux-cachefs@redhat.com,
	LKML <linux-kernel@vger.kernel.org>,
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>
Subject: Re: [Linux-cachefs] [PATCH] fs: judging context via
	current_is_kswapd instead of gfp_flag
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 9, 2021 at 4:26 AM David Howells <dhowells@redhat.com> wrote:
>
> Huangzhaoyang <huangzhaoyang@gmail.com> wrote:
>
> [adding linux-cachefs to the cc list]
>
> > Kswapd uses GFP_KERNEL as gfp_flag which make the judgment of
> > context is unexpected. fix it by using current_is_kswapd.
> >
> > Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> > ---
> >  fs/afs/file.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/afs/file.c b/fs/afs/file.c
> > index eb11d04..6c199d5 100644
> > --- a/fs/afs/file.c
> > +++ b/fs/afs/file.c
> > @@ -485,7 +485,7 @@ static int afs_releasepage(struct page *page, gfp_t gfp_flags)
> >        * elected to wait */
> >  #ifdef CONFIG_AFS_FSCACHE
> >       if (PageFsCache(page)) {
> > -             if (!(gfp_flags & __GFP_DIRECT_RECLAIM) || !(gfp_flags & __GFP_FS))
> > +             if (current_is_kswapd() || !(gfp_flags & __GFP_FS))
> >                       return false;
> >               wait_on_page_fscache(page);
> >       }
>
> I have several of these in my fscache-rewrite branch, spread across a number
> of filesystems.  Should I fix all of them the same way?
>
> fs/9p/vfs_addr.c:               if (!gfpflags_allow_blocking(gfp) || !(gfp & __GFP_FS))
> fs/afs/file.c:          if (!gfpflags_allow_blocking(gfp) || !(gfp & __GFP_FS))
> fs/nfs/file.c:          if (!gfpflags_allow_blocking(gfp) || !(gfp & __GFP_FS))
> fs/nfs/fscache.h:               if (!gfpflags_allow_blocking(gfp) || !(gfp & __GFP_FS))
>
> David
If the gfp flag here is used for judging kswapd context, I think the
answer is yes as kswapd applied __GFP_DIRECT_RECLAIM.
>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

