Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC583598D0
	for <lists+linux-cachefs@lfdr.de>; Fri,  9 Apr 2021 11:09:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617959366;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=q6TWPogpwMzZih8Sz4kko6EuOxS6b/ls0ziQYejiN94=;
	b=eeC7VZS8jDAAj3BjjQWnh16aLP15//qiOtGGrRoy+W49SpAVRSS7PTdZA806GYJiyoc+WI
	jArVMGrix8YmpIdcxesv00v7YWvKlS+Dh7ovzNNwlpsN1t/R8ONARp7zTXkfQv4kVei+TU
	L1VqCFbnlaPEStPazpjSa9OOFR8NgR0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-mI6kNw_bM4uNyWUrONK-Qw-1; Fri, 09 Apr 2021 05:09:24 -0400
X-MC-Unique: mI6kNw_bM4uNyWUrONK-Qw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3127F6414C;
	Fri,  9 Apr 2021 09:09:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E379819C66;
	Fri,  9 Apr 2021 09:09:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C10CB85C4;
	Fri,  9 Apr 2021 09:09:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13999DS4015319 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 05:09:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 434B95D9F2; Fri,  9 Apr 2021 09:09:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-35.rdu2.redhat.com
	[10.10.119.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 529765D9E3;
	Fri,  9 Apr 2021 09:09:06 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <YG+s0iw5o91KQIlW@zeniv-ca.linux.org.uk>
References: <YG+s0iw5o91KQIlW@zeniv-ca.linux.org.uk>
	<161789062190.6155.12711584466338493050.stgit@warthog.procyon.org.uk>
	<161789064740.6155.11932541175173658065.stgit@warthog.procyon.org.uk>
To: Al Viro <viro@zeniv.linux.org.uk>
MIME-Version: 1.0
Date: Fri, 09 Apr 2021 10:09:05 +0100
Message-ID: <289825.1617959345@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Steve French <sfrench@samba.org>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Anna Schumaker <anna.schumaker@netapp.com>,
	linux-fsdevel@vger.kernel.org,
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
Content-ID: <289824.1617959345.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Al Viro <viro@zeniv.linux.org.uk> wrote:

> > +#define iterate_all_kinds(i, n, v, I, B, K, X) {		\
> 
> Do you have any users that would pass different B and X?
> 
> > @@ -1440,7 +1665,7 @@ ssize_t iov_iter_get_pages_alloc(struct iov_iter *i,
> >  		return v.bv_len;
> >  	}),({
> >  		return -EFAULT;
> > -	})
> > +	}), 0
> 
> Correction - users that might get that flavour.  This one explicitly checks
> for xarray and doesn't get to iterate_... in that case.

This is the case for iterate_all_kinds(), but not for iterate_and_advance().

See _copy_mc_to_iter() for example: that can return directly out of the middle
of the loop, so the X variant must drop the rcu_read_lock(), but the B variant
doesn't need to.  You also can't just use break to get out as the X variant
has a loop within a loop to handle iteration over the subelements of a THP.

But with iterate_all_kinds(), I could just drop the X parameter and use the B
parameter for both, I think.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

