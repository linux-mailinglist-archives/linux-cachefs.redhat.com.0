Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 936D7224E99
	for <lists+linux-cachefs@lfdr.de>; Sun, 19 Jul 2020 04:03:01 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-d5c6WFZkPQiIzYUnk-WeKg-1; Sat, 18 Jul 2020 22:02:58 -0400
X-MC-Unique: d5c6WFZkPQiIzYUnk-WeKg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E62C80183C;
	Sun, 19 Jul 2020 02:02:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBEBC100164C;
	Sun, 19 Jul 2020 02:02:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 659B79A120;
	Sun, 19 Jul 2020 02:02:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06J22gDI000333 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 18 Jul 2020 22:02:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5AE45F5ACE; Sun, 19 Jul 2020 02:02:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5703FF567F
	for <linux-cachefs@redhat.com>; Sun, 19 Jul 2020 02:02:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DCF492490A
	for <linux-cachefs@redhat.com>; Sun, 19 Jul 2020 02:02:39 +0000 (UTC)
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [195.92.253.2]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-181-EH4xeKJhPe-JyzSl77XZZQ-1; Sat, 18 Jul 2020 22:02:34 -0400
X-MC-Unique: EH4xeKJhPe-JyzSl77XZZQ-1
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
	Linux)) id 1jwyNY-00FOFG-MQ; Sun, 19 Jul 2020 01:44:36 +0000
Date: Sun, 19 Jul 2020 02:44:36 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: David Howells <dhowells@redhat.com>
Message-ID: <20200719014436.GG2786714@ZenIV.linux.org.uk>
References: <159465784033.1376674.18106463693989811037.stgit@warthog.procyon.org.uk>
	<159465785214.1376674.6062549291411362531.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <159465785214.1376674.6062549291411362531.stgit@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	linux-cachefs@redhat.com, Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 01/32] iov_iter: Add ITER_MAPPING
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jul 13, 2020 at 05:30:52PM +0100, David Howells wrote:
> Add an iterator, ITER_MAPPING, that walks through a set of pages attached
> to an address_space, starting at a given page and offset and walking for
> the specified amount of bytes.
> 
> The caller must guarantee that the pages are all present and they must be
> locked using PG_locked, PG_writeback or PG_fscache to prevent them from
> going away or being migrated whilst they're being accessed.
> 
> This is useful for copying data from socket buffers to inodes in network
> filesystems and for transferring data between those inodes and the cache
> using direct I/O.
> 
> Whilst it is true that ITER_BVEC could be used instead, that would require
> a bio_vec array to be allocated to refer to all the pages - which should be
> redundant if inode->i_pages also points to all these pages.
> 
> This could also be turned into an ITER_XARRAY, taking and xarray pointer
> instead of a mapping pointer.  It would be mostly trivial, except for the
> use of find_get_pages_contig() by iov_iter_get_pages*().
> 

My main problem here is that your iterate_mapping() assumes that STEP is
safe under rcu_read_lock(), with no visible mentioning of that fact.
Note, BTW, that iov_iter_for_each_range() quietly calls user-supplied
callback in such context.

Incidentally, do you ever have different steps for bvec and mapping?

> +	if (unlikely(iov_iter_is_mapping(i))) {
> +		/* We really don't want to fetch pages if we can avoid it */
> +		i->iov_offset += size;
> +		i->count -= size;
> +		return;

That's... not nice.  At the very least you want to cap size by i->count here
(and for discard case as well, while we are at it).

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

