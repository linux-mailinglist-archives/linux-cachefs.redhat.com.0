Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 268A93682CE
	for <lists+linux-cachefs@lfdr.de>; Thu, 22 Apr 2021 16:55:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-74gKG9hFNyyr-rt3w6AeCA-1; Thu, 22 Apr 2021 10:55:05 -0400
X-MC-Unique: 74gKG9hFNyyr-rt3w6AeCA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E40A192AB96;
	Thu, 22 Apr 2021 14:51:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E511719C59;
	Thu, 22 Apr 2021 14:51:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 25DEF44A58;
	Thu, 22 Apr 2021 14:51:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13MEpRU9000459 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 22 Apr 2021 10:51:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D1B87107690; Thu, 22 Apr 2021 14:51:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCFAA10769F
	for <linux-cachefs@redhat.com>; Thu, 22 Apr 2021 14:51:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 065F4A28810
	for <linux-cachefs@redhat.com>; Thu, 22 Apr 2021 14:51:25 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-354-izlIxxVAM4KLlduVHBtCXQ-1;
	Thu, 22 Apr 2021 10:51:18 -0400
X-MC-Unique: izlIxxVAM4KLlduVHBtCXQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B63461425;
	Thu, 22 Apr 2021 14:51:15 +0000 (UTC)
Message-ID: <95de6e0ff902903cfc8825a4e0b7f1c64594630f.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>
Date: Thu, 22 Apr 2021 10:51:13 -0400
In-Reply-To: <2293710.1619099492@warthog.procyon.org.uk>
References: <27c369a8f42bb8a617672b2dc0126a5c6df5a050.camel@kernel.org>
	<161789062190.6155.12711584466338493050.stgit@warthog.procyon.org.uk>
	<161789064740.6155.11932541175173658065.stgit@warthog.procyon.org.uk>
	<2293710.1619099492@warthog.procyon.org.uk>
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34)
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, Dominique,
	Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH v6 01/30] iov_iter: Add ITER_XARRAY
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

On Thu, 2021-04-22 at 14:51 +0100, David Howells wrote:
> Jeff Layton <jlayton@kernel.org> wrote:
> 
> > As a general note, iov_iter.c could really do with some (verbose)
> > comments explaining things. A kerneldoc header that explains the
> > arguments to iterate_all_kinds would sure make this easier to review.
> 
> Definitely.  But that really requires a separate patch.
> 

I suppose.

> > > @@ -1126,7 +1199,12 @@ void iov_iter_revert(struct iov_iter *i, size_t unroll)
> > >  		return;
> > >  	}
> > >  	unroll -= i->iov_offset;
> > > -	if (iov_iter_is_bvec(i)) {
> > > +	if (iov_iter_is_xarray(i)) {
> > > +		BUG(); /* We should never go beyond the start of the specified
> > > +			* range since we might then be straying into pages that
> > > +			* aren't pinned.
> > > +			*/
> > 
> > It's not needed now, but there are a lot of calls to iov_iter_revert in
> > the kernel, and going backward doesn't necessarily mean we'd be straying
> > into an unpinned range. xarray_start never changes; would it not be ok
> > to allow reverting as long as you don't move to a lower offset than that
> > point?
> 
> This is handled starting a couple of lines above the start of the hunk:
> 
> 	if (unroll <= i->iov_offset) {
> 		i->iov_offset -= unroll;
> 		return;
> 	}
> 
> As long as the amount you want to unroll by doesn't exceed the amount you've
> consumed of the iterator, it will allow you to do it.  The BUG is there to
> catch someone attempting to over-revert (and there's no way to return an
> error).
> 

Ahh thanks. I misread that bit. That makes sense. Sucks about having to
BUG() there, but I'm not sure what else you can do.

> > > +static ssize_t iter_xarray_copy_pages(struct page **pages, struct xarray *xa,
> > > +				       pgoff_t index, unsigned int nr_pages)
> > 
> > nit: This could use a different name -- I was expecting to see page
> > _contents_ copied here, but it's just populating the page array with
> > pointers.
> 
> Fair point.  Um...  how about iter_xarray_populate_pages() or
> iter_xarray_list_pages()?
> 

I like "populate" better.

> > I think you've planned to remove iov_iter_for_each_range as well? I'll
> > assume that this is going away. It might be nice to post the latest
> > version of this patch with that change, just for posterity.
> 
> I'll put that in a separate patch.
> 
> > In any case, this all looks reasonable to me, modulo a few nits and a
> > general dearth of comments.
> > 
> > Reviewed-by: Jeff Layton <jlayton@kernel.org>
> 
> Thanks,
> David
> 

Cheers,
-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

