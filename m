Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 95134359DBE
	for <lists+linux-cachefs@lfdr.de>; Fri,  9 Apr 2021 13:46:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-oXO0MSQGNq23hRlBqvcOqw-1; Fri, 09 Apr 2021 07:46:36 -0400
X-MC-Unique: oXO0MSQGNq23hRlBqvcOqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 594861883522;
	Fri,  9 Apr 2021 11:46:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 49F3C6F974;
	Fri,  9 Apr 2021 11:46:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F2DD01806D0F;
	Fri,  9 Apr 2021 11:46:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139BkU5h000643 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 07:46:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D146C10547B6; Fri,  9 Apr 2021 11:46:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC61010B7C90
	for <linux-cachefs@redhat.com>; Fri,  9 Apr 2021 11:46:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A272185A79C
	for <linux-cachefs@redhat.com>; Fri,  9 Apr 2021 11:46:27 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-241-fhxLbs_KO_q1Wgo_EhI_1Q-1; Fri, 09 Apr 2021 07:46:23 -0400
X-MC-Unique: fhxLbs_KO_q1Wgo_EhI_1Q-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lUpZI-000Iht-4A; Fri, 09 Apr 2021 11:45:05 +0000
Date: Fri, 9 Apr 2021 12:44:56 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210409114456.GT2531743@casper.infradead.org>
References: <YG+s0iw5o91KQIlW@zeniv-ca.linux.org.uk>
	<161789062190.6155.12711584466338493050.stgit@warthog.procyon.org.uk>
	<161789064740.6155.11932541175173658065.stgit@warthog.procyon.org.uk>
	<289825.1617959345@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <289825.1617959345@warthog.procyon.org.uk>
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Steve French <sfrench@samba.org>, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Al Viro <viro@zeniv.linux.org.uk>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 09, 2021 at 10:09:05AM +0100, David Howells wrote:
> Al Viro <viro@zeniv.linux.org.uk> wrote:
> 
> > > +#define iterate_all_kinds(i, n, v, I, B, K, X) {		\
> > 
> > Do you have any users that would pass different B and X?
> > 
> > > @@ -1440,7 +1665,7 @@ ssize_t iov_iter_get_pages_alloc(struct iov_iter *i,
> > >  		return v.bv_len;
> > >  	}),({
> > >  		return -EFAULT;
> > > -	})
> > > +	}), 0
> > 
> > Correction - users that might get that flavour.  This one explicitly checks
> > for xarray and doesn't get to iterate_... in that case.
> 
> This is the case for iterate_all_kinds(), but not for iterate_and_advance().
> 
> See _copy_mc_to_iter() for example: that can return directly out of the middle
> of the loop, so the X variant must drop the rcu_read_lock(), but the B variant
> doesn't need to.  You also can't just use break to get out as the X variant
> has a loop within a loop to handle iteration over the subelements of a THP.

"Why does it need a loop? bvecs can contain multi-page vectors"
"memcpy_from_page can't handle that"
"doesn't that mean that iterating over a bvec is already broken?"
"yes"

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

