Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DAFE5233991
	for <lists+linux-cachefs@lfdr.de>; Thu, 30 Jul 2020 22:05:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596139533;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6elcQKg1uq/lOa9YmPXPNFys4Ql6b2E0lMuiagplhng=;
	b=OmBvB1IhH5NWyArxv1PwZFdAB41t1c+hY6hE9m0y0hTGgT7P01PzbX08T8M5YhDpXB5az7
	XvLDBoLAMhxsxBHsoGBT15osjyNlpjTCFY9+v/rlYMypMFS7cdz/EbFwzRnhWL8Rlrwb1M
	qPi5hWguPPzotOU/9uNyOH4LnTawAz0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-pud4zfoCO9WU9FrSbHeV_Q-1; Thu, 30 Jul 2020 16:05:31 -0400
X-MC-Unique: pud4zfoCO9WU9FrSbHeV_Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1A37106B21D;
	Thu, 30 Jul 2020 20:05:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C29E1992D;
	Thu, 30 Jul 2020 20:05:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B3D3F1809554;
	Thu, 30 Jul 2020 20:04:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06UK0Ik8004349 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 30 Jul 2020 16:00:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 157991032A2; Thu, 30 Jul 2020 20:00:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 113BAFED3C
	for <linux-cachefs@redhat.com>; Thu, 30 Jul 2020 20:00:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0D60801183
	for <linux-cachefs@redhat.com>; Thu, 30 Jul 2020 20:00:15 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
	[209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-327-94Pf3fInNFqA4nPF-5RTXw-1; Thu, 30 Jul 2020 16:00:12 -0400
X-MC-Unique: 94Pf3fInNFqA4nPF-5RTXw-1
Received: by mail-ed1-f72.google.com with SMTP id l5so5932467eds.16
	for <linux-cachefs@redhat.com>; Thu, 30 Jul 2020 13:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NPdZyLicOie2yuhM6uwppOmu13ULBAeVkvM5uHH6Cco=;
	b=AbeifU0SXBcl1T3iMHNsrqZT+mTaf3XY5+oIv4RVs7jxbz4fPWGsdUIxdfnJEOP1cG
	iM+68mOhUeAligX21MvYYh4Ap5NmkNwflus6UH8aIvLiev77yk2HTvwVpaubACrJd0L8
	/SrCcUjO9U1EACRf2oUd3lBaQYUYOckv5mB/Zcbpc1G4fRix/H/Ok51Dwqv7sCE/CjH3
	9IyoUBo9BC7ma1ePu5gKfdrVXqaRljHDn9r3DXwRtHKfdOYL+wre5SfA904ZAaaSPS1o
	Jt7PpIOdBeihZkNOkKceZFdHcMWFjq9Og3lD4QnZsLUTtwjvWutEMh/pix+yUFYAbrjb
	LHAQ==
X-Gm-Message-State: AOAM5303arbQbKFoHROVXKkDFkSz5j2/gmToRGDMbIpjQMeZtkNcLuwg
	d10kbItbewBPjme4tzszz3TvpnEFYCd1rHqZkjVYAaxaq/wBib7Xz6c/IPCtROxqXhptazwx/Qt
	6kPDzlzrs19EoUwlMLxAC2H0P5SW5kVsLggZzjQ==
X-Received: by 2002:a05:6402:3048:: with SMTP id
	bu8mr636875edb.367.1596139210895; 
	Thu, 30 Jul 2020 13:00:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytEI6jQOO+iNyhha6KDoOFKhoYduot0O0a9ho32t/vGiBcPlnl+5o5Uo6oUzU6/robXMSAfn8L2+GkpUR56m8=
X-Received: by 2002:a05:6402:3048:: with SMTP id
	bu8mr636844edb.367.1596139210667; 
	Thu, 30 Jul 2020 13:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <1596031949-26793-1-git-send-email-dwysocha@redhat.com>
	<1596031949-26793-14-git-send-email-dwysocha@redhat.com>
	<43e8a8ff1ea015bb7bd335d5616268d36155327a.camel@redhat.com>
	<CALF+zOnYLbibbYxvbyUJFJQ+NtcreuAvFkZYr9h3_qQswbMxRw@mail.gmail.com>
In-Reply-To: <CALF+zOnYLbibbYxvbyUJFJQ+NtcreuAvFkZYr9h3_qQswbMxRw@mail.gmail.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Thu, 30 Jul 2020 15:59:34 -0400
Message-ID: <CALF+zOn9tSft_QkPaJ7w8v_OLTfon+acUB_W9MSb8EEMQGc94w@mail.gmail.com>
To: Jeff Layton <jlayton@redhat.com>, David Howells <dhowells@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs <linux-nfs@vger.kernel.org>, linux-cachefs@redhat.com,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: Re: [Linux-cachefs] [RFC PATCH v2 13/14] NFS: Call
 fscache_resize_cookie() when inode size changes due to setattr
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 30, 2020 at 3:23 PM David Wysochanski <dwysocha@redhat.com> wrote:
>
> On Thu, Jul 30, 2020 at 2:39 PM Jeff Layton <jlayton@redhat.com> wrote:
> >
> > On Wed, 2020-07-29 at 10:12 -0400, Dave Wysochanski wrote:
> > > Handle truncate / setattr when fscache is enabled by calling
> > > fscache_resize_cookie().
> > >
> > > Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
> > > ---
> > >  fs/nfs/inode.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
> > > index 45067303348c..6b814246d07d 100644
> > > --- a/fs/nfs/inode.c
> > > +++ b/fs/nfs/inode.c
> > > @@ -667,6 +667,7 @@ static int nfs_vmtruncate(struct inode * inode, loff_t offset)
> > >       spin_unlock(&inode->i_lock);
> > >       truncate_pagecache(inode, offset);
> > >       spin_lock(&inode->i_lock);
> > > +     fscache_resize_cookie(nfs_i_fscache(inode), i_size_read(inode));
> > >  out:
> > >       return err;
> > >  }
> >
> > truncate can happen even when you have no open file descriptors on the
> > file and therefore w/o the cookie being "used". In the ceph vmtruncate
> > handling code, I do an explicit use/unuse around this call. Do you need
> > to do the same here?
> > --
> > Jeff Layton <jlayton@redhat.com>
> >
>
> Actually I think the case you mention is covered by a patch that I've just
> added today on top of my v2 posting.
> This was the result of looking deeper into a few xfstest failures with
> NFSv4.2.  I think this covers the truncate without a file open:
>
> commit 91d6922df9390ca1c090911be6e5c5ab1a79ea83
> Author: Dave Wysochanski <dwysocha@redhat.com>
> Date:   Thu Jul 30 12:33:40 2020 -0400
>
>     NFS: Call fscache_invalidate() from nfs_invalidate_mapping()
>
>     Be sure to invalidate fscache cookie for any call to
>     nfs_invalidate_mapping().
>
>     This patch fixes the following xfstests on NFS4.x:
>       generic/240
>     as well as fixes the following xfstests on NFSv4.2:
>       generic/029 generic/030
>
>     Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
>
> diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
> index 6b814246d07d..62243ec05917 100644
> --- a/fs/nfs/inode.c
> +++ b/fs/nfs/inode.c
> @@ -1233,6 +1233,7 @@ static int nfs_invalidate_mapping(struct inode
> *inode, struct address_space *map
>         struct nfs_inode *nfsi = NFS_I(inode);
>         int ret;
>
> +       nfs_fscache_invalidate(inode, 0);
>         if (mapping->nrpages != 0) {
>                 if (S_ISREG(inode->i_mode)) {
>                         ret = nfs_sync_mapping(mapping);


Actually the above patch fixes truncates when a file is open, not the
case that Jeff mentions.

To be honest I'm not sure about needing a call to fscache_use/unuse_cookie()
around the call to fscache_resize_cookie().  If the cookie has a
refcount of 1 when it is created, and a file is never opened, so
we never call fscache_use_cookie(), what might happen inside
fscache_resize_cookie()?  The header on use_cookie() says
/*
 * Start using the cookie for I/O.  This prevents the backing object from being
 * reaped by VM pressure.
 */

But we're not using it for I/O in this case.
I will have to dig deeper to be sure, or maybe David H will elaborate further.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

