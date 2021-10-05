Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B35234227B6
	for <lists+linux-cachefs@lfdr.de>; Tue,  5 Oct 2021 15:24:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633440243;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2oo3CzPsgB5EMBaFRbLRerifKYrZAxWCURgCXn7NC7o=;
	b=eLjvLBjC+OKIMx1z92BiXU04z9E50fZcZnEOvzakJs4P4mvxkOyBCUtIKJIv0sD6ZG6aXM
	+n+Zsqtv6qpx0xkcvcAiClGRBNwZf0pVGA4EyYHN2cU1l/fUwYbd4dcnx8zy4kGKwbglZn
	4zMm90dXhQnEhfC8RHKQDUNhBRejLVI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-Da3r2gJXNJiavNaVDZXP4g-1; Tue, 05 Oct 2021 09:24:02 -0400
X-MC-Unique: Da3r2gJXNJiavNaVDZXP4g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9BA8100D684;
	Tue,  5 Oct 2021 13:24:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F8D060936;
	Tue,  5 Oct 2021 13:24:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2F44F4E58F;
	Tue,  5 Oct 2021 13:24:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 195DNvlE006468 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 5 Oct 2021 09:23:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D4F892166B40; Tue,  5 Oct 2021 13:23:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFC582166B2F
	for <linux-cachefs@redhat.com>; Tue,  5 Oct 2021 13:23:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3684718A6582
	for <linux-cachefs@redhat.com>; Tue,  5 Oct 2021 13:23:44 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
	[209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-179-TNN6AsooMHiZJeCERbq01w-1; Tue, 05 Oct 2021 09:23:42 -0400
X-MC-Unique: TNN6AsooMHiZJeCERbq01w-1
Received: by mail-ed1-f70.google.com with SMTP id
	d23-20020a50f697000000b003daf215e1efso6278581edn.23
	for <linux-cachefs@redhat.com>; Tue, 05 Oct 2021 06:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RKbR8FvCeBTSeT0pNhTRGhTE4CVwvkMvkOIjlwXIta8=;
	b=Z5UT6gIYNurEb7MPivIlPCub9RP87kZ10C1dLkZkS1iQiROV3UWAK2LvLMEnB9i8oS
	EZ3gWCtVYJQkjaZecu+gRJZ0fYxEIvOZVSSVYPeT6NerBMOWhB/8TOkWcjQwlcB/eqgI
	eWH97+ee6nF1RS+QRNww05e4eIJFcS6j9AbVpfku3GY0PuYpjV0+ZUaxBbjmdo5jYifO
	mn/m1TiFELmvyG5bPgi/Zky3HItfrmUj0WU/cvzHGMljdi86Ki4ccpjy8XZez5Pf9oLa
	YJk2RHMqufN3zWUcikVDfFOlyFHwpjRdWJu3Pmvuz9zhzgbkSjVZ+u3SOBthJBGBHykd
	pyow==
X-Gm-Message-State: AOAM533rV4cBYNhX1HMjCpY3H8p72idyACz2vM5nTafPqI4jQ/myQlWK
	tPsDMAhEiD5POs1E30n/L0i+n2SLLnGhBSxgguPEqwVCn/ZJBXImblH4qOKTjKi2c2i+NuF3I8E
	pdZqNKLYXxF5yvb/XmIJbxqhuHcH4764fA3Uz7w==
X-Received: by 2002:a05:6402:358c:: with SMTP id
	y12mr25460199edc.159.1633440221782; 
	Tue, 05 Oct 2021 06:23:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdGA4t7WXHUSSGDTBF5EAERIk1rUUvS4aOVk+e37jrlTSplgDO4SduLt1XdrwMUBcmAUpFGK19GXYzmIfBAiU=
X-Received: by 2002:a05:6402:358c:: with SMTP id
	y12mr25460181edc.159.1633440221606; 
	Tue, 05 Oct 2021 06:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <1633288958-8481-1-git-send-email-dwysocha@redhat.com>
	<1633288958-8481-2-git-send-email-dwysocha@redhat.com>
	<1078846.1633438369@warthog.procyon.org.uk>
In-Reply-To: <1078846.1633438369@warthog.procyon.org.uk>
From: David Wysochanski <dwysocha@redhat.com>
Date: Tue, 5 Oct 2021 09:23:04 -0400
Message-ID: <CALF+zOk1P22ePaDTwZto-hT+TcqYE=oepqwe13sFjYbPEFYxLw@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs <linux-nfs@vger.kernel.org>,
	linux-cachefs <linux-cachefs@redhat.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH v1 1/7] NFS: Fixup patch 3/8 of
	fscache-iter-3 v2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 5, 2021 at 8:52 AM David Howells <dhowells@redhat.com> wrote:
>
> Dave Wysochanski <dwysocha@redhat.com> wrote:
>
> >
> > Handle failed return values of fscache_fallback_read_page() in
> > switch statement.
>
> After some discussion on IRC, the attached is probably better.  Returning 1
> might result in 1 being returned through ->readpage(), which could be a
> problem.
>
> David
> ---
> diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
> index 5b0e78742444..68e266a37675 100644
> --- a/fs/nfs/fscache.c
> +++ b/fs/nfs/fscache.c
> @@ -346,33 +346,18 @@ int __nfs_readpage_from_fscache(struct inode *inode, struct page *page)
>
>         ret = fscache_fallback_read_page(nfs_i_fscache(inode), page);
>         if (ret < 0) {
> -               dfprintk(FSCACHE, "NFS:    readpage_from_fscache: "
> -                        "fscache_fallback_read_page failed ret = %d\n", ret);
> -               return ret;
> -       }
> -
> -       switch (ret) {
> -       case 0: /* Read completed synchronously */
> -               dfprintk(FSCACHE,
> -                        "NFS:    readpage_from_fscache: read successful\n");
> -               nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_OK);
> -               SetPageUptodate(page);
> -               return 0;
> -
> -       case -ENOBUFS: /* inode not in cache */
> -       case -ENODATA: /* page not in cache */
>                 nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_FAIL);
>                 dfprintk(FSCACHE,
> -                        "NFS:    readpage_from_fscache %d\n", ret);
> -               SetPageChecked(page);
> -               return 1;
> -
> -       default:
> -               dfprintk(FSCACHE, "NFS:    readpage_from_fscache %d\n", ret);
> -               nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_FAIL);
> +                        "NFS:    readpage_from_fscache failed %d\n", ret);
>                 SetPageChecked(page);
> +               return ret;
>         }
> -       return ret;
> +
> +       /* Read completed synchronously */
> +       dfprintk(FSCACHE, "NFS:    readpage_from_fscache: read successful\n");
> +       nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_OK);
> +       SetPageUptodate(page);
> +       return 0;
>  }
>
>  /*
>

Yes this looks good.
Acked-by: Dave Wysochanski <dwysocha@redhat.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

