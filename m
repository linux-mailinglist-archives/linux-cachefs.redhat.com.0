Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5217D304648
	for <lists+linux-cachefs@lfdr.de>; Tue, 26 Jan 2021 19:29:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611685786;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=X78tL7ZWy8hsqXZm7BEGNMI2G6HAr6ZX2ZSJWvYnxcs=;
	b=i3pfQ2bo5CG8T7sC6u466SBNsliw2XLuOe9HhbYy0f+YMB365MWXKeI4flI1KuC511Oz9j
	FV+WcEFjJHend+4jMWw1j1pm8TBhMgmhcWX9L1lvvJvCt64tZ9bOlDd8OPV/N0gBZMjWqE
	GMpk0NAer+2+DiIOvidBHBwlO/QFXQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-E-Sffgc2M4m-40m1WpWPdQ-1; Tue, 26 Jan 2021 13:29:44 -0500
X-MC-Unique: E-Sffgc2M4m-40m1WpWPdQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA17459;
	Tue, 26 Jan 2021 18:29:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10DD45D9C2;
	Tue, 26 Jan 2021 18:29:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 401255002C;
	Tue, 26 Jan 2021 18:29:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QIQgMQ008443 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 13:26:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1568D2166B2D; Tue, 26 Jan 2021 18:26:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 103A92166B29
	for <linux-cachefs@redhat.com>; Tue, 26 Jan 2021 18:26:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19B001875050
	for <linux-cachefs@redhat.com>; Tue, 26 Jan 2021 18:26:39 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
	[209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-527-xAPEvcvgPviGUVvdv62wvg-1; Tue, 26 Jan 2021 13:26:37 -0500
X-MC-Unique: xAPEvcvgPviGUVvdv62wvg-1
Received: by mail-ed1-f70.google.com with SMTP id ck25so9750687edb.16
	for <linux-cachefs@redhat.com>; Tue, 26 Jan 2021 10:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2fOOzn8pPhlTKm9KikLbj00xwMG7fV3rZ/r/LGxiqKA=;
	b=ipWCD8fAu12qgmfT9CHFHnnTfsFaA5manM2FVnh879FtGj1wb4SZLipmkstXgDvR3h
	Ovg/Xg5uelfxNuTP4quR1B8+GCRBfAF15o9TlBuHAZQ0jqwAL0TbHlJN9e13pMC7ac8t
	kiJ6JHt7hwcBFneKvwEIYQngmRCHyHY/84W73PhYXIVLRE72TN/hEuKtVkTIY1jPfwdf
	pG7TK0v6ziwy3y/4UQatOu7yEgjhUjt9FXvyzz89Il854mMlOPWgFCyom6aBwb7HfP9f
	813e9LHCOzDkjoVnbvLpvjh/Sx7BBlUo7qTeUcfBTGA9sijGlNBnXM+BKs3AN2vWZP89
	/Z3w==
X-Gm-Message-State: AOAM5338q5kLr7vFz4e36mxBJDI+Iq8Ut1jiwK+CIgK7f7HrpJHekSs9
	5jjrC7HDMTSSW5aNOTYXiOUJtnKlZUBQpZL5C6XEQLKSle9Sicfzk5HjbgEb5QgAj36Sf4UnfGp
	YkSRz2SmoY3mKKMiV7s8do8cWJbSsUWu1hN0yBQ==
X-Received: by 2002:a17:906:409:: with SMTP id d9mr4137067eja.70.1611685595819;
	Tue, 26 Jan 2021 10:26:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEFq3YOlGW6iMDijn0AhVKCr8FbAfIU0rqEW4JxM7phQSOhY8lxoG5RgplzfjnQ6XssK0VTMbS4BNxu0SuS8k=
X-Received: by 2002:a17:906:409:: with SMTP id d9mr4137063eja.70.1611685595666;
	Tue, 26 Jan 2021 10:26:35 -0800 (PST)
MIME-Version: 1.0
References: <161161025063.2537118.2009249444682241405.stgit@warthog.procyon.org.uk>
	<161161064956.2537118.3354798147866150631.stgit@warthog.procyon.org.uk>
	<20210126013611.GI308988@casper.infradead.org>
In-Reply-To: <20210126013611.GI308988@casper.infradead.org>
From: David Wysochanski <dwysocha@redhat.com>
Date: Tue, 26 Jan 2021 13:25:59 -0500
Message-ID: <CALF+zO=4kyvR+9T48ZF6Cu-izLkbs-1m3S_ebDNWv-zuC5GSRA@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs <linux-nfs@vger.kernel.org>,
	linux-cifs <linux-cifs@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-afs@lists.infradead.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 32/32] NFS: Convert readpage to
 readahead and use netfs_readahead for fscache
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 25, 2021 at 8:37 PM Matthew Wilcox <willy@infradead.org> wrote:
>
>
> For Subject: s/readpage/readpages/
>
Fixed

> On Mon, Jan 25, 2021 at 09:37:29PM +0000, David Howells wrote:
> > +int __nfs_readahead_from_fscache(struct nfs_readdesc *desc,
> > +                              struct readahead_control *rac)
>
> I thought you wanted it called ractl instead of rac?  That's what I've
> been using in new code.
>
Fixed

> > -     dfprintk(FSCACHE, "NFS: nfs_getpages_from_fscache (0x%p/%u/0x%p)\n",
> > -              nfs_i_fscache(inode), npages, inode);
> > +     dfprintk(FSCACHE, "NFS: nfs_readahead_from_fscache (0x%p/0x%p)\n",
> > +              nfs_i_fscache(inode), inode);
>
> We do have readahead_count() if this is useful information to be logging.
>
Right, I used it elsewhere so I'll add here as well.

> > +static inline int nfs_readahead_from_fscache(struct nfs_readdesc *desc,
> > +                                          struct readahead_control *rac)
> >  {
> > -     if (NFS_I(inode)->fscache)
> > -             return __nfs_readpages_from_fscache(ctx, inode, mapping, pages,
> > -                                                 nr_pages);
> > +     if (NFS_I(rac->mapping->host)->fscache)
> > +             return __nfs_readahead_from_fscache(desc, rac);
> >       return -ENOBUFS;
> >  }
>
> Not entirely sure that it's worth having the two functions separated any more.
>
Yeah it's questionable so I'll collapse.  I'll also do that with
nfs_readpage_from_fscache().

> >       /* attempt to read as many of the pages as possible from the cache
> >        * - this returns -ENOBUFS immediately if the cookie is negative
> >        */
> > -     ret = nfs_readpages_from_fscache(desc.ctx, inode, mapping,
> > -                                      pages, &nr_pages);
> > +     ret = nfs_readahead_from_fscache(&desc, rac);
> >       if (ret == 0)
> >               goto read_complete; /* all pages were read */
> >
> >       nfs_pageio_init_read(&desc.pgio, inode, false,
> >                            &nfs_async_read_completion_ops);
> >
> > -     ret = read_cache_pages(mapping, pages, readpage_async_filler, &desc);
> > +     while ((page = readahead_page(rac))) {
> > +             ret = readpage_async_filler(&desc, page);
> > +             put_page(page);
> > +     }
>
> I thought with the new API we didn't need to do this kind of thing
> any more?  ie no matter whether fscache is configured in or not, it'll
> submit the I/Os.
>

We don't. This patchset was only intended as a stepping stone to get the
netfs API accepted with minimal invasiveness in NFS.

I have another patch which will unconditionally call netfs API but I
didn't post it. Since I'm not an NFS maintainer, and maintainer's didn't
weigh in on the approach, I opted to go with the least invasive approach.

There's an NFS "remote bakeathon" coming up at the end of Feb.
That would probably be a good time to get further testing on NFS
unconditionally calling the netfs API, and we should be able to
cover things like any performance concerns, etc.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

