Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 232452FF145
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Jan 2021 18:03:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611248603;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EJ9anOSEnHpv3VMq1riYg5vjhpEdhFULCR941e8IvYU=;
	b=W0L/1+md+MLqtcBSrtToPxbkQqJhW/6azDoc+Xjvaa7HbS0bSGUitKj/u6+E19h39OMLaT
	HKF4HfiAeUAz1jrlpQ5Z60lf566RorE8kTyz3uVp8POR6bVuFl3tHfA0ogB+e8JzMs/kYz
	XEbEXMyBPPABz3W4mNY7R1u20aZFcPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-Q2NOyyVhPzWzOXadxS1wcQ-1; Thu, 21 Jan 2021 12:03:21 -0500
X-MC-Unique: Q2NOyyVhPzWzOXadxS1wcQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1067F835DE3;
	Thu, 21 Jan 2021 17:03:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3AE360BF3;
	Thu, 21 Jan 2021 17:03:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 47934180954D;
	Thu, 21 Jan 2021 17:03:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10LH3E8Z002809 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 21 Jan 2021 12:03:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9FB8060C6B; Thu, 21 Jan 2021 17:03:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com
	[10.10.115.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DCE6960C43;
	Thu, 21 Jan 2021 17:02:57 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210121164645.GA20964@fieldses.org>
References: <20210121164645.GA20964@fieldses.org>
	<161118128472.1232039.11746799833066425131.stgit@warthog.procyon.org.uk>
To: bfields@fieldses.org (J. Bruce Fields)
MIME-Version: 1.0
Date: Thu, 21 Jan 2021 17:02:57 +0000
Message-ID: <1794286.1611248577@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Takashi Iwai <tiwai@suse.de>,
	Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [RFC][PATCH 00/25] Network fs helper library &
	fscache kiocb API
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1794285.1611248577.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

J. Bruce Fields <bfields@fieldses.org> wrote:

> On Wed, Jan 20, 2021 at 10:21:24PM +0000, David Howells wrote:
> >      Note that this uses SEEK_HOLE/SEEK_DATA to locate the data available
> >      to be read from the cache.  Whilst this is an improvement from the
> >      bmap interface, it still has a problem with regard to a modern
> >      extent-based filesystem inserting or removing bridging blocks of
> >      zeros.
> 
> What are the consequences from the point of view of a user?

The cache can get both false positive and false negative results on checks for
the presence of data because an extent-based filesystem can, at will, insert
or remove blocks of contiguous zeros to make the extents easier to encode
(ie. bridge them or split them).

A false-positive means that you get a block of zeros in the middle of your
file that very probably shouldn't be there (ie. file corruption); a
false-negative means that we go and reload the missing chunk from the server.

The problem exists in cachefiles whether we use bmap or we use
SEEK_HOLE/SEEK_DATA.  The only way round it is to keep track of what data is
present independently of backing filesystem's metadata.

To this end, it shouldn't (mis)behave differently than the code already there
- except that it handles better the case in which the backing filesystem
blocksize != PAGE_SIZE (which may not be relevant on an extent-based
filesystem anyway if it packs parts of different files together in a single
block) because the current implementation only bmaps the first block in a page
and doesn't probe for the rest.

Fixing this requires a much bigger overhaul of cachefiles than this patchset
performs.

Also, it works towards getting rid of this use of bmap, but that's not user
visible.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

