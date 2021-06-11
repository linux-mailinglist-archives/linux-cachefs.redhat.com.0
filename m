Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1CB3A4598
	for <lists+linux-cachefs@lfdr.de>; Fri, 11 Jun 2021 17:38:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-QCA-fxzHPtmgEOkhUn9F6Q-1; Fri, 11 Jun 2021 11:38:52 -0400
X-MC-Unique: QCA-fxzHPtmgEOkhUn9F6Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8D8A89CD0F;
	Fri, 11 Jun 2021 15:38:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE14C60C05;
	Fri, 11 Jun 2021 15:38:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9AEC11809CAD;
	Fri, 11 Jun 2021 15:38:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15BFclT0013481 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 11 Jun 2021 11:38:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6CC5D16C2C8; Fri, 11 Jun 2021 15:38:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 675EE16C2C6
	for <linux-cachefs@redhat.com>; Fri, 11 Jun 2021 15:38:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B3F81825065
	for <linux-cachefs@redhat.com>; Fri, 11 Jun 2021 15:38:44 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-72-7vzvMCdgNQWJu-Fv_H1zJg-1; 
	Fri, 11 Jun 2021 11:38:42 -0400
X-MC-Unique: 7vzvMCdgNQWJu-Fv_H1zJg-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D689613CD;
	Fri, 11 Jun 2021 15:38:40 +0000 (UTC)
Message-ID: <d9fec91d22d985737ceefbc2b8f02c42dfed7df8.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Matthew Wilcox <willy@infradead.org>, David Howells <dhowells@redhat.com>
Date: Fri, 11 Jun 2021 11:38:39 -0400
In-Reply-To: <YMN/PfW2t8e5M58m@casper.infradead.org>
References: <a24c3c070c9fc3529a51f00f9ccc3d0abdd0b821.camel@kernel.org>
	<20200916173854.330265-1-jlayton@kernel.org>
	<20200916173854.330265-6-jlayton@kernel.org>
	<7817f98d3b2daafe113bf8290cc8c7adbb86fe99.camel@kernel.org>
	<m2h7i45vzl.fsf@discipline.rit.edu>
	<66264.1623424309@warthog.procyon.org.uk>
	<YMN/PfW2t8e5M58m@casper.infradead.org>
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: Andrew W Elble <aweits@rit.edu>, pfmeec@rit.edu, ceph-devel@vger.kernel.org,
	linux-cachefs@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2021-06-11 at 16:20 +0100, Matthew Wilcox wrote:
> On Fri, Jun 11, 2021 at 04:11:49PM +0100, David Howells wrote:
> > Jeff Layton <jlayton@kernel.org> wrote:
> > 
> > > On Fri, 2021-06-11 at 10:14 -0400, Andrew W Elble wrote:
> > > > We're seeing file corruption while running 5.10, bisected to 1cc1699070bd:
> > > > 
> > > > > > +static int ceph_write_begin(struct file *file, struct address_space *mapping,
> > > > > > +			    loff_t pos, unsigned len, unsigned flags,
> > > > > > +			    struct page **pagep, void **fsdata)
> > > > 
> > > > <snip>
> > > > 
> > > > > > +		/*
> > > > > > +		 * In some cases we don't need to read at all:
> > > > > > +		 * - full page write
> > > > > > +		 * - write that lies completely beyond EOF
> > > > > > +		 * - write that covers the the page from start to EOF or beyond it
> > > > > > +		 */
> > > > > > +		if ((pos_in_page == 0 && len == PAGE_SIZE) ||
> > > > > > +		    (pos >= i_size_read(inode)) ||
> > > > 
> > > > Shouldn't this be '((pos & PAGE_MASK) >= i_size_read(inode)) ||' ?
> > > > 
> > > > Seems like fs/netfs/read_helper.c currently has the same issue?
> 
> How does (pos & PAGE_MASK) >= i_size_read() make sense?  That could only
> be true if the file is less than a page in size, whereas it should
> always be true if the write starts outside the current i_size.
> 

Yeah, I guess what we really need is to round the i_size up to the start
of the next page and then compare whether pos is beyond that.

> > That's not quite right either.  page may be larger than PAGE_MASK if
> > grab_cache_page_write_begin() returns a THP (if that's possible).
> > 
> > Maybe:
> > 
> > 	(pos & thp_size(page) - 1) >= i_size_read(inode)
> > 
> > Really, we want something like thp_pos().  Maybe Willy has something like that
> > up his sleeve.
> > 
> > In fact, in netfs_write_begin(), index and pos_in_page should be calculated
> > after grab_cache_page_write_begin() has been called, just in case the new page
> > extends before the page containing the requested position.
> 
> Yes.  I do that kind of thing in iomap.  What you're doing there looks
> a bit like offset_in_folio(), but I don't understand the problem with
> just checking pos against i_size directly.
> 

Suppose the i_size is 3 and you do a 1 byte write at offset 5. You're
beyond the EOF, so the condition would return true, but you still need
to read in the start of the page in that case.

I think we probably need a testcase that does this in xfstests:

open file
write 3 bytes at start
close
unmount or drop pagecache in some way
then write 1 byte at offset 5
see whether the resulting contents match the expect ones

>
https://git.infradead.org/users/willy/pagecache.git/shortlog/refs/heads/folio
> contains a number of commits that start 'iomap:' which may be of interest.

-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

