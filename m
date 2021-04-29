Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4E68B36E764
	for <lists+linux-cachefs@lfdr.de>; Thu, 29 Apr 2021 10:52:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-90Iafbw4PkWLNhLmqUbvxQ-1; Thu, 29 Apr 2021 04:52:42 -0400
X-MC-Unique: 90Iafbw4PkWLNhLmqUbvxQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00C37107ACCA;
	Thu, 29 Apr 2021 08:52:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B821E60FC2;
	Thu, 29 Apr 2021 08:52:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 71CE31809C82;
	Thu, 29 Apr 2021 08:52:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13T8qb3E002064 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 29 Apr 2021 04:52:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E22252156A23; Thu, 29 Apr 2021 08:52:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD3CF20BDB35
	for <linux-cachefs@redhat.com>; Thu, 29 Apr 2021 08:52:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07194858F09
	for <linux-cachefs@redhat.com>; Thu, 29 Apr 2021 08:52:34 +0000 (UTC)
Received: from nautica.notk.org (nautica.notk.org [91.121.71.147]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-170-AEir9Ub7NCWWo3w_nnsxyA-1; Thu, 29 Apr 2021 04:52:31 -0400
X-MC-Unique: AEir9Ub7NCWWo3w_nnsxyA-1
Received: by nautica.notk.org (Postfix, from userid 108)
	id 32900C01E; Thu, 29 Apr 2021 10:44:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on nautica.notk.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=UNPARSEABLE_RELAY
	autolearn=unavailable version=3.3.2
Received: from odin.codewreck.org (localhost [127.0.0.1])
	by nautica.notk.org (Postfix) with ESMTPS id 47670C009;
	Thu, 29 Apr 2021 10:44:14 +0200 (CEST)
Received: from localhost (odin.codewreck.org [local])
	by odin.codewreck.org (OpenSMTPD) with ESMTPA id faf44a92;
	Thu, 29 Apr 2021 08:44:09 +0000 (UTC)
Date: Thu, 29 Apr 2021 17:43:54 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <YIpxyi8l4LX/oTSJ@codewreck.org>
References: <CAMuHMdXJZ7iNQE964CdBOU=vRKVMFzo=YF_eiwsGgqzuvZ+TuA@mail.gmail.com>
	<161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk>
	<161918455721.3145707.4063925145568978308.stgit@warthog.procyon.org.uk>
	<442393.1619685697@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <442393.1619685697@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Steve French <sfrench@samba.org>,
	Marc Dionne <marc.dionne@auristor.com>, linux-cachefs@redhat.com,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Linux FS Devel <linux-fsdevel@vger.kernel.org>,
	V9FS Developers <v9fs-developer@lists.sourceforge.net>,
	ceph-devel <ceph-devel@vger.kernel.org>, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH v7 07/31] netfs: Make a netfs helper
	module
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David Howells wrote on Thu, Apr 29, 2021 at 09:41:37AM +0100:
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > I see later patches make AFS and FSCACHE select NETFS_SUPPORT.  If this
> > is just a library of functions, to be selected by its users, then please
> > make the symbol invisible.
> 
> Ideally, yes, it would be an invisible symbol enabled by select from the
> network filesystems that use it - but doing that means that you can't choose
> whether to build it in or build it as a module.

Afaik such dependencies are then built as a module if everything it
depends on are modules, and built-in if any of these are built-in.

I think most users would be fine with that -- there's little reason to
have netfs built-in if AFS ceph etc all are modules?

-- 
Dominique

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

