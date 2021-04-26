Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 983D036BCA4
	for <lists+linux-cachefs@lfdr.de>; Tue, 27 Apr 2021 02:26:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-Urv-YGBlPtmj7rjQdv1tGw-1; Mon, 26 Apr 2021 20:26:51 -0400
X-MC-Unique: Urv-YGBlPtmj7rjQdv1tGw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9783B107ACE3;
	Tue, 27 Apr 2021 00:26:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8595A5C730;
	Tue, 27 Apr 2021 00:26:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4515C44A57;
	Tue, 27 Apr 2021 00:26:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13QM7BxX001198 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 26 Apr 2021 18:07:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D31C41007610; Mon, 26 Apr 2021 22:07:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx01.redhat.com
	(mimecast05.extmail.prod.ext.phx2.redhat.com [10.5.110.76])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCE4510016F8
	for <linux-cachefs@redhat.com>; Mon, 26 Apr 2021 22:07:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 310D28030D6
	for <linux-cachefs@redhat.com>; Mon, 26 Apr 2021 22:07:08 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-574-3GO3JiQNMFuJ-nUfmxEsKA-1; Mon, 26 Apr 2021 18:07:06 -0400
X-MC-Unique: 3GO3JiQNMFuJ-nUfmxEsKA-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lb9NK-0069d6-6I; Mon, 26 Apr 2021 22:06:45 +0000
Date: Mon, 26 Apr 2021 23:06:42 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210426220642.GU235567@casper.infradead.org>
References: <20210426210939.GS235567@casper.infradead.org>
	<161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk>
	<3726642.1619471184@warthog.procyon.org.uk>
	<3737237.1619472003@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <3737237.1619472003@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Mon, 26 Apr 2021 20:26:43 -0400
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, linux-mm@kvack.org,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	Marc Dionne <marc.dionne@auristor.com>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Mike Marshall <hubcap@omnibond.com>
Subject: Re: [Linux-cachefs] [PATCH v2] netfs: Miscellaneous fixes
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

On Mon, Apr 26, 2021 at 10:20:03PM +0100, David Howells wrote:
> Okay, how about the attached, then?

LGTM!  Thanks.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

