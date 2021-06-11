Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1C93A4838
	for <lists+linux-cachefs@lfdr.de>; Fri, 11 Jun 2021 19:57:46 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-pcuD-cUoMeGGx-PyGDP0Cg-1; Fri, 11 Jun 2021 13:57:43 -0400
X-MC-Unique: pcuD-cUoMeGGx-PyGDP0Cg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BF088049CD;
	Fri, 11 Jun 2021 17:57:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D4D760854;
	Fri, 11 Jun 2021 17:57:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2DDC746F59;
	Fri, 11 Jun 2021 17:57:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15BHvZmW026277 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 11 Jun 2021 13:57:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3B9FB117C2E6; Fri, 11 Jun 2021 17:57:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37A9B117C2E4
	for <linux-cachefs@redhat.com>; Fri, 11 Jun 2021 17:57:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7301E80D0E0
	for <linux-cachefs@redhat.com>; Fri, 11 Jun 2021 17:57:32 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-430-Ai-aNPZhOo-2yfnoiEyfag-1; Fri, 11 Jun 2021 13:57:30 -0400
X-MC-Unique: Ai-aNPZhOo-2yfnoiEyfag-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lrlOY-002zx8-Nm; Fri, 11 Jun 2021 17:56:51 +0000
Date: Fri, 11 Jun 2021 18:56:38 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <YMOj1rjCOb4fQo5Y@casper.infradead.org>
References: <YMN/PfW2t8e5M58m@casper.infradead.org>
	<a24c3c070c9fc3529a51f00f9ccc3d0abdd0b821.camel@kernel.org>
	<20200916173854.330265-1-jlayton@kernel.org>
	<20200916173854.330265-6-jlayton@kernel.org>
	<7817f98d3b2daafe113bf8290cc8c7adbb86fe99.camel@kernel.org>
	<m2h7i45vzl.fsf@discipline.rit.edu>
	<66264.1623424309@warthog.procyon.org.uk>
	<68477.1623425725@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <68477.1623425725@warthog.procyon.org.uk>
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
Cc: Andrew W Elble <aweits@rit.edu>, pfmeec@rit.edu, ceph-devel@vger.kernel.org,
	linux-cachefs@redhat.com, Jeff Layton <jlayton@kernel.org>
Subject: Re: [Linux-cachefs] [PATCH 5/5] ceph: fold
 ceph_update_writeable_page into ceph_write_begin
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 11, 2021 at 04:35:25PM +0100, David Howells wrote:
> Matthew Wilcox <willy@infradead.org> wrote:
> 
> > Yes.  I do that kind of thing in iomap.  What you're doing there looks
> > a bit like offset_in_folio(), but I don't understand the problem with
> > just checking pos against i_size directly.
> 
> pos can be in the middle of a page.  If i_size is at, say, the same point in
> the middle of that page and the page isn't currently in the cache, then we'll
> just clear the entire page and not read the bottom part of it (ie. the bit
> prior to the EOF).

The comment says that's expected, though.  I think the comment is wrong;
consider the case where the page size is 4kB, file is 5kB long and
we do a 1kB write at offset=6kB.  The existing CEPH code (prior to
netfs) will zero out 4-6KB and 7-8kB, which is wrong.

Anyway, looking at netfs_write_begin(), it's wrong too, in a bunch of
ways.  You don't need to zero out the part of the page you're going to
copy into.  And the condition is overly complicated which makes it
hard to know what's going on.  Setting aside the is_cache_enabled part,
I think you want:

	if (offset == 0 && len >= thp_size(page))
		goto have_page_no_wait;
	if (page_offset(page) >= size) {
		zero_user_segments(page, 0, offset,
				   offset + len, thp_size(page));
		goto have_page_no_wait;
	}
	... read the interesting chunks of page ...

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

