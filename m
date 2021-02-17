Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B5F4732286C
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Feb 2021 11:01:39 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-fBGJPOUwNRymEZYK0VPXcQ-1; Tue, 23 Feb 2021 05:00:02 -0500
X-MC-Unique: fBGJPOUwNRymEZYK0VPXcQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82D4418B62AB;
	Tue, 23 Feb 2021 09:59:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D25919C45;
	Tue, 23 Feb 2021 09:59:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 553AB58074;
	Tue, 23 Feb 2021 09:59:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11HEbFt1005822 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 17 Feb 2021 09:37:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E196C10E60E8; Wed, 17 Feb 2021 14:37:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD9BB10E60EA
	for <linux-cachefs@redhat.com>; Wed, 17 Feb 2021 14:37:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EB6B100AFE1
	for <linux-cachefs@redhat.com>; Wed, 17 Feb 2021 14:37:12 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
	[209.85.210.41]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-306-lVevki0oMnqDCsOIwGczUA-1; Wed, 17 Feb 2021 09:37:08 -0500
X-MC-Unique: lVevki0oMnqDCsOIwGczUA-1
Received: by mail-ot1-f41.google.com with SMTP id l23so12147515otn.10
	for <linux-cachefs@redhat.com>; Wed, 17 Feb 2021 06:37:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KRNZjZzTqfrWLRx1QJmelJFfxfPUcehdqwqj+L7mkPQ=;
	b=fGEqIv2DecTc1/zG28vYJLyaSCXK4cGfBtBmr+masTA5GGf7a65yYJikuJwhI33/Io
	KJNcO42GozYlTE0mHqyO5eJFDhjtrlactL/3yTi8hRiFR0RcCRyw69+OW6hWt7wPkEQd
	LVOuVB7OeZx4KAzQELbKrBnuVfQG/YGdOt1C0eavoO0pRQWphPSw+wUTYhmhzXWJMNHw
	Jbo8im26qpiM9FxC92pbGGRY2Cp9thp35+y/+n1k2f6MQsN2EN8nWhfjqY7ci0GvVW3E
	UUBoS2rB7I8sMZHRcU22XbKH+4e8bKdV7iZ4hwoQfNGV+xdpccwuCU+QPMpqOkd4hvP9
	auaA==
X-Gm-Message-State: AOAM533D6g4NPsXuVzuITXmhWhQLWAaDTjiHZqLTEwfnL6ImpMAuvvEe
	SYoFobUZE6762AQd3SerdSQ1pyjHS6aRAVn1RK8j3Q==
X-Google-Smtp-Source: ABdhPJy4hyW/PUrDPGqVg3UI4ZfJfCb8Vr2cdTNl0Mc8udn+hWDu9ZRGdP0xDV4oyRaIVmDhAucDgP/5yXuHdlUvdPs=
X-Received: by 2002:a05:6830:2424:: with SMTP id
	k4mr7412732ots.352.1613572627726; 
	Wed, 17 Feb 2021 06:37:07 -0800 (PST)
MIME-Version: 1.0
References: <161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
	<161340389201.1303470.14353807284546854878.stgit@warthog.procyon.org.uk>
	<20210216103215.GB27714@lst.de>
	<20210216132251.GI2858050@casper.infradead.org>
In-Reply-To: <20210216132251.GI2858050@casper.infradead.org>
From: Mike Marshall <hubcap@omnibond.com>
Date: Wed, 17 Feb 2021 09:36:56 -0500
Message-ID: <CAOg9mSQYBjnMsDj5pMd6MOGTY5w_ZR=pw7VRYKfP5ZwmHBj2=Q@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 23 Feb 2021 04:59:26 -0500
Cc: Steve French <sfrench@samba.org>,
	Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>, linux-mm <linux-mm@kvack.org>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	V9FS Developers <v9fs-developer@lists.sourceforge.net>,
	ceph-devel <ceph-devel@vger.kernel.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 03/33] mm: Implement readahead_control
	pageset expansion
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I plan to try and use readahead_expand in Orangefs...

-Mike

On Tue, Feb 16, 2021 at 8:28 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Feb 16, 2021 at 11:32:15AM +0100, Christoph Hellwig wrote:
> > On Mon, Feb 15, 2021 at 03:44:52PM +0000, David Howells wrote:
> > > Provide a function, readahead_expand(), that expands the set of pages
> > > specified by a readahead_control object to encompass a revised area with a
> > > proposed size and length.
> > >
> > > The proposed area must include all of the old area and may be expanded yet
> > > more by this function so that the edges align on (transparent huge) page
> > > boundaries as allocated.
> > >
> > > The expansion will be cut short if a page already exists in either of the
> > > areas being expanded into.  Note that any expansion made in such a case is
> > > not rolled back.
> > >
> > > This will be used by fscache so that reads can be expanded to cache granule
> > > boundaries, thereby allowing whole granules to be stored in the cache, but
> > > there are other potential users also.
> >
> > So looking at linux-next this seems to have a user, but that user is
> > dead wood given that nothing implements ->expand_readahead.
> >
> > Looking at the code structure I think netfs_readahead and
> > netfs_rreq_expand is a complete mess and needs to be turned upside
> > down, that is instead of calling back from netfs_readahead to the
> > calling file system, split it into a few helpers called by the
> > caller.
>
> That's funny, we modelled it after iomap.
>
> > But even after this can't we just expose the cache granule boundary
> > to the VM so that the read-ahead request gets setup correctly from
> > the very beginning?
>
> The intent is that this be usable by filesystems which want to (for
> example) compress variable sized blocks.  So they won't know which pages
> they want to readahead until they're in their iomap actor routine,
> see that the extent they're in is compressed, and find out how large
> the extent is.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

