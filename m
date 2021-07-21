Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 81A163D16C2
	for <lists+linux-cachefs@lfdr.de>; Wed, 21 Jul 2021 21:00:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626894057;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=B2yH4jF0rUbUNtbcAXpQ+uCzvjItRZd1Tdt3vWNXZws=;
	b=N8oNM8yASAujAvwCcJI0c0qGbicZz5UzgiB3LwhHiW/eQgHP8sTpXDXfubPoyum2Hhw8zK
	EWIQ1pUnjonrpWyMiAEJZOIss8sW2ZnqiIe/mIYkxKBodUBGVbpFCEudCp47Dl6MBjrSPr
	QCOWLr2+Pg0sbI+n32pymNPtK/b0vo8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-RrSttDrjOimMDSEaNwHuPw-1; Wed, 21 Jul 2021 15:00:56 -0400
X-MC-Unique: RrSttDrjOimMDSEaNwHuPw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C432B107466C;
	Wed, 21 Jul 2021 19:00:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 839005D9DD;
	Wed, 21 Jul 2021 19:00:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF0464BB7C;
	Wed, 21 Jul 2021 19:00:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16LJ0pqH011237 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 21 Jul 2021 15:00:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 23452FDCD4; Wed, 21 Jul 2021 19:00:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F640FDCD5
	for <linux-cachefs@redhat.com>; Wed, 21 Jul 2021 19:00:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23A16866DF9
	for <linux-cachefs@redhat.com>; Wed, 21 Jul 2021 19:00:47 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
	[209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-265-eOuGtMn_PbiFSpeGgBOpbg-1; Wed, 21 Jul 2021 15:00:45 -0400
X-MC-Unique: eOuGtMn_PbiFSpeGgBOpbg-1
Received: by mail-qt1-f197.google.com with SMTP id
	q1-20020a05622a0301b029025f76cabdfcso2082318qtw.15
	for <linux-cachefs@redhat.com>; Wed, 21 Jul 2021 12:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=1gH3Ux0CT6hU+v/YeUAIBalSzkDA3DKDpAjmYag8B8E=;
	b=Se0N1GDTKgUa8zrlbdHxioHaRr73tL8735Blf4hCS5CVivMn+iH6EEz+X5+E8ImVfX
	VfUrKQxkWqfhgnKpIVoqUEiUJPrM41JRcdbCftQTW1T0WQ5x+mCpqVgQpgfvxKDJ+19O
	Qn1gVAshwyGggbS7XNd6Kdq+ht/zNxpG+nU6j9mCcG8MPL9RY+sNRbDaUrer2aB0O8d1
	45RKbbaZ01etu430u7MfK0KsZ0rKk786wSK014WQBcBMq1YZU5ErfAzFLvSfB48K2GMK
	MsQgNQxhpR8MRj9JC+8sl3wSvFqLtuDR8ZyNcyERoAvP9Zs1Xu/FPpTekYU4Jz+7pS0l
	qxUQ==
X-Gm-Message-State: AOAM533knd603g5v5Oi/AlYTn+4PA3qj8wnfIBkMo0zfsVYXnNvLoYDg
	xAZD+uO00EkWR4Xkpg5iT/tPa3lK5gpjePxmlHpUqjekpGwYpkxjBP+t4t5q4xErrWIC295Yz6B
	0S4D9fP57G84xmSUXTvQhFQ==
X-Received: by 2002:a0c:e70f:: with SMTP id d15mr4739141qvn.47.1626894045391; 
	Wed, 21 Jul 2021 12:00:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLJs8XXnPDqD0EYRCTwpJGY8jpuBbe7MH5DxMPfLcBBLk08k/UTRTJHL2M7llSs52l9VDF/g==
X-Received: by 2002:a0c:e70f:: with SMTP id d15mr4739113qvn.47.1626894045207; 
	Wed, 21 Jul 2021 12:00:45 -0700 (PDT)
Received: from [192.168.1.3] (68-20-15-154.lightspeed.rlghnc.sbcglobal.net.
	[68.20.15.154])
	by smtp.gmail.com with ESMTPSA id x7sm9290487qtw.24.2021.07.21.12.00.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 21 Jul 2021 12:00:44 -0700 (PDT)
Message-ID: <56b3c140a388b98f74f2e71c656e77655da3129f.camel@redhat.com>
From: Jeff Layton <jlayton@redhat.com>
To: David Howells <dhowells@redhat.com>
Date: Wed, 21 Jul 2021 15:00:43 -0400
In-Reply-To: <298117.1626893692@warthog.procyon.org.uk>
References: <e7a3b850e8a42845f4e020c7642743b3dce2b9f1.camel@redhat.com>
	<162687506932.276387.14456718890524355509.stgit@warthog.procyon.org.uk>
	<162687511125.276387.15493860267582539643.stgit@warthog.procyon.org.uk>
	<298117.1626893692@warthog.procyon.org.uk>
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cachefs@redhat.com, Szeredi <miklos@szeredi.hu>,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve, linux-mm@kvack.org, Miklos,
	Shyam Prasad N <nspmangalore@gmail.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	devel@lists.orangefs.org, Mike Marshall <hubcap@omnibond.com>
Subject: Re: [Linux-cachefs] [RFC PATCH 03/12] netfs: Remove
 netfs_read_subrequest::transferred
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2021-07-21 at 19:54 +0100, David Howells wrote:
> Jeff Layton <jlayton@redhat.com> wrote:
> 
> > The above two deltas seem like they should have been in patch #2.
> 
> Yeah.  Looks like at least partially so.
> 
> > > @@ -635,15 +625,8 @@ void netfs_subreq_terminated(struct netfs_read_subrequest *subreq,
> > >  		goto failed;
> > >  	}
> > >  
> > > -	if (WARN(transferred_or_error > subreq->len - subreq->transferred,
> > > -		 "Subreq overread: R%x[%x] %zd > %zu - %zu",
> > > -		 rreq->debug_id, subreq->debug_index,
> > > -		 transferred_or_error, subreq->len, subreq->transferred))
> > > -		transferred_or_error = subreq->len - subreq->transferred;
> > > -
> > >  	subreq->error = 0;
> > > -	subreq->transferred += transferred_or_error;
> > > -	if (subreq->transferred < subreq->len)
> > > +	if (iov_iter_count(&subreq->iter))
> > >  		goto incomplete;
> > >  
> > 
> > I must be missing it, but where does subreq->iter get advanced to the
> > end of the current read? If you're getting rid of subreq->transferred
> > then I think that has to happen above, no?
> 
> For afs, afs_req_issue_op() points fsreq->iter at the subrequest iterator and
> calls afs_fetch_data().  Thereafter, we wend our way to
> afs_deliver_fs_fetch_data() or yfs_deliver_fs_fetch_data() which set
> call->iter to point to that iterator and then call afs_extract_data() which
> passes it to rxrpc_kernel_recv_data(), which eventually passes it to
> skb_copy_datagram_iter(), which advances the iterator.
> 
> For the cache, the subrequest iterator is passed to the cache backend by
> netfs_read_from_cache().  This would be cachefiles_read() which calls
> vfs_iocb_iter_read() which I thought advances the iterator (leastways,
> filemap_read() keeps going until iov_iter_count() reaches 0 or some other stop
> condition occurs and doesn't thereafter call iov_iter_revert()).
> 

Ok, this will probably regress ceph then. We don't really have anything
to do with the subreq->iter at this point and this patch doesn't change
that. If you're going to make this change, it'd be cleaner to also fix
up ceph_netfs_issue_op to advance the iter at the same time.
-- 
Jeff Layton <jlayton@redhat.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

