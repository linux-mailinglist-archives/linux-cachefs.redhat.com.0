Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id F378736BA58
	for <lists+linux-cachefs@lfdr.de>; Mon, 26 Apr 2021 21:54:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532--gh8OfjsMf2TIMMSvOvc1g-1; Mon, 26 Apr 2021 15:54:21 -0400
X-MC-Unique: -gh8OfjsMf2TIMMSvOvc1g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0F1A83DD24;
	Mon, 26 Apr 2021 19:54:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79C4C5C234;
	Mon, 26 Apr 2021 19:54:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 11BC044A5B;
	Mon, 26 Apr 2021 19:54:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13QJqw0A023047 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 26 Apr 2021 15:52:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 12E1B2094D0D; Mon, 26 Apr 2021 19:52:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C7BE2094D0F
	for <linux-cachefs@redhat.com>; Mon, 26 Apr 2021 19:52:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 506168001E8
	for <linux-cachefs@redhat.com>; Mon, 26 Apr 2021 19:52:55 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
	[142.44.231.140]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-206-brZQcoSbO3ODVXyu4o1dwg-1; Mon, 26 Apr 2021 15:52:51 -0400
X-MC-Unique: brZQcoSbO3ODVXyu4o1dwg-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lb7Hl-008TqF-IE; Mon, 26 Apr 2021 19:52:49 +0000
Date: Mon, 26 Apr 2021 19:52:49 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: David Howells <dhowells@redhat.com>
Message-ID: <YIcaESRqrBRqD/EQ@zeniv-ca.linux.org.uk>
References: <YIcMVCkp4xswHolw@zeniv-ca.linux.org.uk>
	<161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk>
	<161918448151.3145707.11541538916600921083.stgit@warthog.procyon.org.uk>
	<3651951.1619465011@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <3651951.1619465011@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 26, 2021 at 08:23:31PM +0100, David Howells wrote:

> I really need to defer this question to Willy, but as I understand it,
> xas_retry() only restarts the current iteration.  Referring to the comment on
> xas_reset():
> 
>  * Resets the error or walk state of the @xas so future walks of the
>  * array will start from the root.  Use this if you have dropped the
>  * xarray lock and want to reuse the xa_state.
> 
> I think that the walk returns to the bottom of the tree and whilst xarray
> presents an interface that appears to be a contiguous array, it's actually a
> tree internally - and 'root' is the root of the tree, not the head of the
> array.
> 
> Basically, I think it throws away its cached iteration state - which might
> have been modified - and rewalks the tree to get back to the same index.

>From RTFS(lib/xarray.c) that looks right.  Nevermind the question, then...

Anyway, 

Reviewed-by: Al Viro <viro@zeniv.linux.org.uk>

on the xarray-related bits (this patch + followups)

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

