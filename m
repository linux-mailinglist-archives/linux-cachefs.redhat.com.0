Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB7036A7C0
	for <lists+linux-cachefs@lfdr.de>; Sun, 25 Apr 2021 16:16:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-pjf3JrxlP7ayXGzdjLCdfw-1; Sun, 25 Apr 2021 10:16:54 -0400
X-MC-Unique: pjf3JrxlP7ayXGzdjLCdfw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D8FF343AC;
	Sun, 25 Apr 2021 14:16:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A91319C78;
	Sun, 25 Apr 2021 14:16:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 96EF54EE0B;
	Sun, 25 Apr 2021 14:16:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13PEGiAJ028719 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 25 Apr 2021 10:16:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B550A207ADC2; Sun, 25 Apr 2021 14:16:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0831207B09A
	for <linux-cachefs@redhat.com>; Sun, 25 Apr 2021 14:16:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00B12101A52C
	for <linux-cachefs@redhat.com>; Sun, 25 Apr 2021 14:16:42 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
	[142.44.231.140]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-341-DcXLSbWjOWGF3y8QntHHLQ-1; Sun, 25 Apr 2021 10:16:37 -0400
X-MC-Unique: DcXLSbWjOWGF3y8QntHHLQ-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lafYp-008Arj-GM; Sun, 25 Apr 2021 14:16:35 +0000
Date: Sun, 25 Apr 2021 14:16:35 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: David Howells <dhowells@redhat.com>
Message-ID: <YIV5wyBWC18/DAoU@zeniv-ca.linux.org.uk>
References: <YIVrJT8GwLI0Wlgx@zeniv-ca.linux.org.uk>
	<161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk>
	<161918448151.3145707.11541538916600921083.stgit@warthog.procyon.org.uk>
	<3388475.1619359082@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <3388475.1619359082@warthog.procyon.org.uk>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Apr 25, 2021 at 02:58:02PM +0100, David Howells wrote:

> But for the moment, I guess I should just add:
> 
> 	i->iov_offset += bytes;
> 
> to all three (kvec, bvec and xarray)?

No.  First of all, you'd need ->count updated as well; for kvec and bvec you
*REALLY* don't have to end up with ->iov_offset exceeding the size of current
kvec or bvec resp.; Bad Shit(tm) happens that way.

> 
> > > @@ -1246,7 +1349,8 @@ unsigned long iov_iter_alignment(const struct iov_iter *i)
> > >  	iterate_all_kinds(i, size, v,
> > >  		(res |= (unsigned long)v.iov_base | v.iov_len, 0),
> > >  		res |= v.bv_offset | v.bv_len,
> > > -		res |= (unsigned long)v.iov_base | v.iov_len
> > > +		res |= (unsigned long)v.iov_base | v.iov_len,
> > > +		res |= v.bv_offset | v.bv_len
> > >  	)
> > >  	return res;
> > >  }
> > 
> > Hmm...  That looks like a really bad overkill - do you need anything beyond
> > count and iov_offset in that case + perhaps "do we have the very last page"?
> > IOW, do you need to iterate anything at all here?  What am I missing here?
> 
> Good point.  I wonder, even, if the alignment could just be set to 1.  There's
> no kdoc description on the function that says what the result is meant to
> represent.

Huh?  It's the worst alignment of all segment boundaries, what else?  As in
if (iov_iter_alignment(i) & 1023)
	// we have something in there that isn't 1K-aligned.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

