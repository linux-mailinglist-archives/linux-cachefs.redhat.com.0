Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A980478C6B
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Dec 2021 14:36:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639748171;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DDJUazvlPmPIicIoLtP1j6wqXlXFbNZ609KJuuXo3Y0=;
	b=GBnrXvpF0yYtBtpHcf/je/iMsPbGnUHn2EFPrIQAyJCEX7MOcQNAsiqboLcsLBRM6cjrVO
	Xzwqym+VoKTeeUH751bGMWvc52LGTjL64zo+2dzupwCV+x++eO7zK15Fqt1KON6+Eowpyt
	GyMrrbmsZvEUUmUAM6/vKcYSEq/YRBc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-uVXyNWzAOQ2TPvHehI_egA-1; Fri, 17 Dec 2021 08:36:08 -0500
X-MC-Unique: uVXyNWzAOQ2TPvHehI_egA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2DA063ACF;
	Fri, 17 Dec 2021 13:36:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 523BC610A7;
	Fri, 17 Dec 2021 13:36:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2DFD04BB7C;
	Fri, 17 Dec 2021 13:36:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BHDa0CY017393 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 17 Dec 2021 08:36:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 785122024CCA; Fri, 17 Dec 2021 13:36:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 744C62024CC5
	for <linux-cachefs@redhat.com>; Fri, 17 Dec 2021 13:35:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EFB73800EA6
	for <linux-cachefs@redhat.com>; Fri, 17 Dec 2021 13:35:53 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
	[209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-638-oUCSNW2sMNKW7jeXaPHYRQ-1; Fri, 17 Dec 2021 08:35:52 -0500
X-MC-Unique: oUCSNW2sMNKW7jeXaPHYRQ-1
Received: by mail-ed1-f70.google.com with SMTP id
	d13-20020a056402516d00b003e7e67a8f93so2003983ede.0
	for <linux-cachefs@redhat.com>; Fri, 17 Dec 2021 05:35:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8ZE5+T9FIA/LsIMrDz4C7mJhlzQ37jyiywuLPjaXdaE=;
	b=e0LiBB9wvv18+6jiXXFFL8bxwHIe6xfny3V9o7fEg/PMMBcfHIc379Jjdhh5SAHoic
	PDmLilMJl6bOQtvtm8BRkGOKg8FjeYXM2siew7UX+J8kj3eg+1afanu/M9ppkk/kl8aJ
	XECWzaPMgMp/11mO5+zrBfp7+B0q5qOyK6nt7fPMtLGO80yPOmU6d9whw+W6Eq2MvQ9b
	7zp6CXjyMF/JsQxQA1T9wouA4qOWwD3jjH4Rl4Y0905rmfcNCF80Xrtn4/NgtnwP3Jzp
	r/WM/123S/Lfv9NToC1j5I7tNCFBPDXTRNYUYOtDK5eM2SbJQukDwXNss9lJpe6ZUSvY
	IViw==
X-Gm-Message-State: AOAM5322dlZ2Wqk2alTcHLxGp79bvKq2/OTm1LNQ4DiVhz37EQKInjO7
	YcZ364bLXcnmTR1dwsNp1bCZbvKUvYHzWtSmfLode/P0LWeJy3qG9OmqQi7QeLGi9yltv5h/d+n
	CxxzdL7C5u9hYhqp9/vakSM41xwak0waUAopuJQ==
X-Received: by 2002:a17:906:58d5:: with SMTP id
	e21mr2721159ejs.540.1639748150915; 
	Fri, 17 Dec 2021 05:35:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoiXFGOR4vgjI+ETFq9+5QOetUKZgoPnG9oL5+z8WVRV0/CPuIW6GrT+M51W3JOyXloa+NW5h0jgzKL/ll9Ps=
X-Received: by 2002:a17:906:58d5:: with SMTP id
	e21mr2721144ejs.540.1639748150663; 
	Fri, 17 Dec 2021 05:35:50 -0800 (PST)
MIME-Version: 1.0
References: <163967073889.1823006.12237147297060239168.stgit@warthog.procyon.org.uk>
	<163967182112.1823006.7791504655391213379.stgit@warthog.procyon.org.uk>
	<CALF+zOkvC7kZ9LFQyjsRduQq+-gmaD4bLWc7H=AtVi6=NuC_dA@mail.gmail.com>
	<1958026.1639747261@warthog.procyon.org.uk>
In-Reply-To: <1958026.1639747261@warthog.procyon.org.uk>
From: David Wysochanski <dwysocha@redhat.com>
Date: Fri, 17 Dec 2021 08:35:14 -0500
Message-ID: <CALF+zOnerPWd7wYD0sC_v8rTeN0KHgP2abkDWWVGLr4QVrbSzg@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs <linux-nfs@vger.kernel.org>, Jeff Layton <jlayton@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	linux-cachefs <linux-cachefs@redhat.com>,
	Trond Myklebust <trondmy@hammerspace.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH v3 63/68] nfs: Convert to new fscache
	volume/cookie API
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 17, 2021 at 8:21 AM David Howells <dhowells@redhat.com> wrote:
>
> David Wysochanski <dwysocha@redhat.com> wrote:
>
> > >
> > >  (4) fscache_enable/disable_cookie() have been removed.
> > >
> > >      Call fscache_use_cookie() and fscache_unuse_cookie() when a file is
> > >      opened or closed to prevent a cache file from being culled and to keep
> > >      resources to hand that are needed to do I/O.
> > >
> > >      Unuse the cookie when a file is opened for writing.  This is gated by
> > >      the NFS_INO_FSCACHE flag on the nfs_inode.
> > >
> > >      A better way might be to invalidate it with FSCACHE_INVAL_DIO_WRITE
> > >      which will keep it unused until all open files are closed.
> > >
> >
> > Comment still out of date here, reference
> > https://marc.info/?l=linux-nfs&m=163922984027745&w=4
>
> Okay, how about:
>
>  (4) fscache_enable/disable_cookie() have been removed.
>
>      Call fscache_use_cookie() and fscache_unuse_cookie() when a file is
>      opened or closed to prevent a cache file from being culled and to keep
>      resources to hand that are needed to do I/O.
>
>      If a file is opened for writing, we invalidate it with
>      FSCACHE_INVAL_DIO_WRITE in lieu of doing writeback to the cache,
>      thereby making it cease caching until all currently open files are
>      closed.  This should give the same behaviour as the uptream code.
>      Making the cache store local modifications isn't straightforward for
>      NFS, so that's left for future patches.
>

Yes, that is more accurate.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

