Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 14EF436A9DF
	for <lists+linux-cachefs@lfdr.de>; Mon, 26 Apr 2021 01:26:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619393161;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=r4ABbIqoeykw82b7hZ/toFXSyxkBAyoqLZw2j3tzR44=;
	b=bSjipBQKrYJQzbIlnQzErQnAlvnmJEPosnUzKWusd11bqlWBO4Xor7lEmhAINhSQJpB0mv
	dcIaVvpT7WVAdaPMwM5o7EvZerPgDUGHnz0TiSX6G3tuVKIihrmvNEZIAnre3SdNMMpLRZ
	Qr2yNddX3BoLszncy4A8zIOFths3kUA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-iT2ril86NTizaZ9s3bJF5Q-1; Sun, 25 Apr 2021 19:25:58 -0400
X-MC-Unique: iT2ril86NTizaZ9s3bJF5Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0213A343A6;
	Sun, 25 Apr 2021 23:25:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF0115D74F;
	Sun, 25 Apr 2021 23:25:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B81651809C82;
	Sun, 25 Apr 2021 23:25:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13PDwAL3025512 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 25 Apr 2021 09:58:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 944FC60657; Sun, 25 Apr 2021 13:58:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-124.rdu2.redhat.com
	[10.10.112.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B9C06062F;
	Sun, 25 Apr 2021 13:58:03 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <YIVrJT8GwLI0Wlgx@zeniv-ca.linux.org.uk>
References: <YIVrJT8GwLI0Wlgx@zeniv-ca.linux.org.uk>
	<161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk>
	<161918448151.3145707.11541538916600921083.stgit@warthog.procyon.org.uk>
To: Al Viro <viro@zeniv.linux.org.uk>
MIME-Version: 1.0
Date: Sun, 25 Apr 2021 14:58:02 +0100
Message-ID: <3388475.1619359082@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 13PDwAL3025512
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Sun, 25 Apr 2021 19:25:51 -0400
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, linux-mm@kvack.org,
	Steve French <sfrench@samba.org>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org,
	Marc Dionne <marc.dionne@auristor.com>, linux-cachefs@redhat.com,
	Dominique Martinet <asmadeus@codewreck.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH v7 01/31] iov_iter: Add ITER_XARRAY
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3388474.1619359082.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Al Viro <viro@zeniv.linux.org.uk> wrote:

> > +struct address_space;
> >  struct pipe_inode_info;
> >  
> >  struct kvec {
> 
> What is that chunk for?

Ah, that can go.  It used to be ITER_MAPPING.

> > +		}),
> > +		({
> > +		rem = copy_mc_to_page(v.bv_page, v.bv_offset,
> > +				      (from += v.bv_len) - v.bv_len, v.bv_len);
> > +		if (rem) {
> > +			curr_addr = (unsigned long) from;
> > +			bytes = curr_addr - s_addr - rem;
> > +			rcu_read_unlock();
> > +			return bytes;
> > +		}
> 
> That's broken, same way as kvec and bvec cases are in the same primitive.
> Iterator not advanced on failure halfway through.

Okay.  I just copied what ITER_BVEC does.  Should this be handled in
iterate_and_advance() rather than in the code snippets it takes as parameters?

But for the moment, I guess I should just add:

	i->iov_offset += bytes;

to all three (kvec, bvec and xarray)?

> > @@ -1246,7 +1349,8 @@ unsigned long iov_iter_alignment(const struct iov_iter *i)
> >  	iterate_all_kinds(i, size, v,
> >  		(res |= (unsigned long)v.iov_base | v.iov_len, 0),
> >  		res |= v.bv_offset | v.bv_len,
> > -		res |= (unsigned long)v.iov_base | v.iov_len
> > +		res |= (unsigned long)v.iov_base | v.iov_len,
> > +		res |= v.bv_offset | v.bv_len
> >  	)
> >  	return res;
> >  }
> 
> Hmm...  That looks like a really bad overkill - do you need anything beyond
> count and iov_offset in that case + perhaps "do we have the very last page"?
> IOW, do you need to iterate anything at all here?  What am I missing here?

Good point.  I wonder, even, if the alignment could just be set to 1.  There's
no kdoc description on the function that says what the result is meant to
represent.

> > @@ -1268,7 +1372,9 @@ unsigned long iov_iter_gap_alignment(const struct iov_iter *i)
> > ...
> Very limited use; it shouldn't be called for anything other than IOV_ITER case.
Should that just be cut down, then?

> > @@ -1849,7 +2111,12 @@ int iov_iter_for_each_range(struct iov_iter *i, size_t bytes,
> > ...
> 
> Would be easier to have that sucker removed first...

I could do that.  I'd rather not do that here since it hasn't sat in
linux-next, but since nothing uses it, but Linus might permit it.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

