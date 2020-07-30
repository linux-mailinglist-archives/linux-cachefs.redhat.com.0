Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9096E233249
	for <lists+linux-cachefs@lfdr.de>; Thu, 30 Jul 2020 14:35:33 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-MWLmBKylPSW_RvTrr-d1Lw-1; Thu, 30 Jul 2020 08:35:30 -0400
X-MC-Unique: MWLmBKylPSW_RvTrr-d1Lw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A88A9800461;
	Thu, 30 Jul 2020 12:35:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C18071931;
	Thu, 30 Jul 2020 12:35:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA2B295A74;
	Thu, 30 Jul 2020 12:35:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06UCZPD0005036 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 30 Jul 2020 08:35:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0AD8D2026D69; Thu, 30 Jul 2020 12:35:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 067972026D67
	for <linux-cachefs@redhat.com>; Thu, 30 Jul 2020 12:35:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2022800580
	for <linux-cachefs@redhat.com>; Thu, 30 Jul 2020 12:35:22 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-471-jU7uGQ2aM3OJKOzDJsK4og-1; Thu, 30 Jul 2020 08:35:19 -0400
X-MC-Unique: jU7uGQ2aM3OJKOzDJsK4og-1
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1k17Ty-0003OY-Jv; Thu, 30 Jul 2020 12:16:22 +0000
Date: Thu, 30 Jul 2020 13:16:22 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20200730121622.GB23808@casper.infradead.org>
References: <447452.1596109876@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <447452.1596109876@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	torvalds@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-cachefs] Upcoming: fscache rewrite
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jul 30, 2020 at 12:51:16PM +0100, David Howells wrote:
>  (3) Al has objections to the ITER_MAPPING iov_iter type that I added
> 
> 	https://lore.kernel.org/linux-fsdevel/20200719014436.GG2786714@ZenIV.linux.org.uk/
> 
>      but note that iov_iter_for_each_range() is not actually used by anything.
> 
>      However, Willy likes it and would prefer to make it ITER_XARRAY instead
>      as he might be able to use it in other places, though there's an issue
>      where I'm calling find_get_pages_contig() which takes a mapping (though
>      all it does is then get the xarray out of it).

I suspect you don't need to call find_get_pages_contig().  If you look
at __readahead_batch() in pagemap.h, it does basically what you want
(other than being wrapped up inside the readahead iterator).  You require
the pages already be pinned in the xarray, so there's no need for the
page_cache_get_speculative() dance that find_get_pages_contig) does,
nor the check for xa_is_value().

My main concern with your patchset is that it introduces a new page flag
to sleep on which basically means "I am writing this page to the fscache".
I don't understand why you need it; you've elevated the refcount on
the pages so they're not going to get reused for another purpose.
All it does (as far as I can tell) is make a task calling truncate()
wait for the page to finish being written to cache, which isn't actually
necessary.

Overall, I do like the patch series!  It's a big improvement over what we
currently have and will make it easier to finish the readpages->readahead
conversion.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

