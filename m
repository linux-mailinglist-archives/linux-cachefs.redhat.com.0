Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id ADD683EB109
	for <lists+linux-cachefs@lfdr.de>; Fri, 13 Aug 2021 09:03:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-C3vmlXk0PbG7EXe6bYbSeg-1; Fri, 13 Aug 2021 03:03:46 -0400
X-MC-Unique: C3vmlXk0PbG7EXe6bYbSeg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5A861082924;
	Fri, 13 Aug 2021 07:03:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5489100763B;
	Fri, 13 Aug 2021 07:03:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 84FCC4BB7B;
	Fri, 13 Aug 2021 07:03:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17D6xqB7016217 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 13 Aug 2021 02:59:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CF1C4121135; Fri, 13 Aug 2021 06:59:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9C0A120ED1
	for <linux-cachefs@redhat.com>; Fri, 13 Aug 2021 06:59:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D54A866DF1
	for <linux-cachefs@redhat.com>; Fri, 13 Aug 2021 06:59:49 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-550-to00KMRmMUqqHuYIImqWEw-1; Fri, 13 Aug 2021 02:59:47 -0400
X-MC-Unique: to00KMRmMUqqHuYIImqWEw-1
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
	Linux)) id 1mER4k-00FQ2P-O5; Fri, 13 Aug 2021 06:54:29 +0000
Date: Fri, 13 Aug 2021 07:53:54 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <YRYXAii0zZ0SzDt+@infradead.org>
References: <2408234.1628687271@warthog.procyon.org.uk>
	<YRVHLu3OAwylCONm@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <YRVHLu3OAwylCONm@casper.infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-fsdevel@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Marc Dionne <marc.dionne@auristor.com>,
	ceph-devel@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
	linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [RFC][PATCH] netfs, afs, ceph: Use folios
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 12, 2021 at 05:07:10PM +0100, Matthew Wilcox wrote:
> On Wed, Aug 11, 2021 at 02:07:51PM +0100, David Howells wrote:
> >  (*) Can page_endio() be split into two separate functions, one for read
> >      and one for write?  If seems a waste of time to conditionally switch
> >      between two different branches.
> 
> At this point I'm thinking ...
> 
> static inline void folio_end_read(struct folio *folio, int err)
> {
> 	if (!err)
> 		folio_set_uptodate(folio);
> 	folio_unlock(folio);
> }
> 
> Clearly the page isn't uptodate at this point, or ->readpage wouldn't've
> been called.  So there's no need to clear it.  And PageError is
> completely useless.

Just opencoding the above makes a lot more sense.  No need to turn err
into some acceptable form, and trivial to follow.  Not all little
convenience helpers are good.

> >  	}
> >  
> > -	*_page = page;
> > +	*_page = &folio->page;
> 
> Can't do anything about this one; the write_begin API needs to be fixed.

It actually needs to go away.  There's not real good use for that level
of API. netfs should just open code the releavant parts of
generic_perform_write, similar to iomap.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

