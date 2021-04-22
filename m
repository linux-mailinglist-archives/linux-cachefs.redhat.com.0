Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 959843681E4
	for <lists+linux-cachefs@lfdr.de>; Thu, 22 Apr 2021 15:52:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619099519;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sb/1uW9zgBMErUpO6AutgrYKKH8QdCZ3/htdOuPHDlo=;
	b=UAbbxXhD+FuHxKx8rGwPhpNKRoFnJtZtscSTWPXNYMUvvNQgIchPSsgIIFJOG9ZI9EN9Ea
	C8FeWlbDtB3GbKnG/nMMyDw6+LNXbWUr5vXQR+9vzqXKV8Oaz9HEtd3Ni5wIUjHofzPp0z
	oL+XW6/nw71LpnuyLuNrRCylI0MPUAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-Rei1EW9TO7GDLX2cDiiSMg-1; Thu, 22 Apr 2021 09:51:50 -0400
X-MC-Unique: Rei1EW9TO7GDLX2cDiiSMg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D5EF10C40C3;
	Thu, 22 Apr 2021 13:51:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10A4D369A;
	Thu, 22 Apr 2021 13:51:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 793C644A58;
	Thu, 22 Apr 2021 13:51:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13MDpdh6027821 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 22 Apr 2021 09:51:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E6BEC6061F; Thu, 22 Apr 2021 13:51:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-124.rdu2.redhat.com
	[10.10.112.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0935760938;
	Thu, 22 Apr 2021 13:51:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <27c369a8f42bb8a617672b2dc0126a5c6df5a050.camel@kernel.org>
References: <27c369a8f42bb8a617672b2dc0126a5c6df5a050.camel@kernel.org>
	<161789062190.6155.12711584466338493050.stgit@warthog.procyon.org.uk>
	<161789064740.6155.11932541175173658065.stgit@warthog.procyon.org.uk>
To: Jeff Layton <jlayton@kernel.org>
MIME-Version: 1.0
Date: Thu, 22 Apr 2021 14:51:32 +0100
Message-ID: <2293710.1619099492@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 13MDpdh6027821
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Steve French <sfrench@samba.org>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2293709.1619099492.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@kernel.org> wrote:

> As a general note, iov_iter.c could really do with some (verbose)
> comments explaining things. A kerneldoc header that explains the
> arguments to iterate_all_kinds would sure make this easier to review.

Definitely.  But that really requires a separate patch.

> > @@ -1126,7 +1199,12 @@ void iov_iter_revert(struct iov_iter *i, size_t unroll)
> >  		return;
> >  	}
> >  	unroll -= i->iov_offset;
> > -	if (iov_iter_is_bvec(i)) {
> > +	if (iov_iter_is_xarray(i)) {
> > +		BUG(); /* We should never go beyond the start of the specified
> > +			* range since we might then be straying into pages that
> > +			* aren't pinned.
> > +			*/
> 
> It's not needed now, but there are a lot of calls to iov_iter_revert in
> the kernel, and going backward doesn't necessarily mean we'd be straying
> into an unpinned range. xarray_start never changes; would it not be ok
> to allow reverting as long as you don't move to a lower offset than that
> point?

This is handled starting a couple of lines above the start of the hunk:

	if (unroll <= i->iov_offset) {
		i->iov_offset -= unroll;
		return;
	}

As long as the amount you want to unroll by doesn't exceed the amount you've
consumed of the iterator, it will allow you to do it.  The BUG is there to
catch someone attempting to over-revert (and there's no way to return an
error).

> > +static ssize_t iter_xarray_copy_pages(struct page **pages, struct xarray *xa,
> > +				       pgoff_t index, unsigned int nr_pages)
> 
> nit: This could use a different name -- I was expecting to see page
> _contents_ copied here, but it's just populating the page array with
> pointers.

Fair point.  Um...  how about iter_xarray_populate_pages() or
iter_xarray_list_pages()?

> I think you've planned to remove iov_iter_for_each_range as well? I'll
> assume that this is going away. It might be nice to post the latest
> version of this patch with that change, just for posterity.

I'll put that in a separate patch.

> In any case, this all looks reasonable to me, modulo a few nits and a
> general dearth of comments.
> 
> Reviewed-by: Jeff Layton <jlayton@kernel.org>

Thanks,
David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

