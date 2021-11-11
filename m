Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DB144D850
	for <lists+linux-cachefs@lfdr.de>; Thu, 11 Nov 2021 15:31:55 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-Qdl8yhcsO2CDk5NmI-SnaQ-1; Thu, 11 Nov 2021 09:31:50 -0500
X-MC-Unique: Qdl8yhcsO2CDk5NmI-SnaQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 204F01023F4E;
	Thu, 11 Nov 2021 14:31:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31C0A60854;
	Thu, 11 Nov 2021 14:31:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B0D7E1800FDD;
	Thu, 11 Nov 2021 14:31:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ABETN5N028315 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 11 Nov 2021 09:29:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 549A2400DEF8; Thu, 11 Nov 2021 14:29:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F5C240CFD04
	for <linux-cachefs@redhat.com>; Thu, 11 Nov 2021 14:29:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34926106655C
	for <linux-cachefs@redhat.com>; Thu, 11 Nov 2021 14:29:23 +0000 (UTC)
Received: from nautica.notk.org (nautica.notk.org [91.121.71.147]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-305-v0YCzpakNrmGKtJYggUngA-1; Thu, 11 Nov 2021 09:29:20 -0500
X-MC-Unique: v0YCzpakNrmGKtJYggUngA-1
Received: by nautica.notk.org (Postfix, from userid 108)
	id 05579C020; Thu, 11 Nov 2021 15:29:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on nautica.notk.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=UNPARSEABLE_RELAY
	autolearn=unavailable version=3.3.2
Received: from odin.codewreck.org (localhost [127.0.0.1])
	by nautica.notk.org (Postfix) with ESMTPS id F18D9C009;
	Thu, 11 Nov 2021 15:29:13 +0100 (CET)
Received: from localhost (odin.codewreck.org [local])
	by odin.codewreck.org (OpenSMTPD) with ESMTPA id 33223ae0;
	Thu, 11 Nov 2021 14:29:09 +0000 (UTC)
Date: Thu, 11 Nov 2021 23:28:53 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <YY0opaUbuiqMGHpr@codewreck.org>
References: <163657847613.834781.7923681076643317435.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <163657847613.834781.7923681076643317435.stgit@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	kafs-testing@auristor.com, linux-mm@kvack.org,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	v9fs-developer@lists.sourceforge.net,
	Marc Dionne <marc.dionne@auristor.com>,
	ceph-devel@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
	linux-afs@lists.infradead.org, devel@lists.orangefs.org
Subject: Re: [Linux-cachefs] [PATCH v5 0/4] netfs, 9p, afs,
 ceph: Support folios, at least partially
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

David Howells wrote on Wed, Nov 10, 2021 at 09:07:56PM +0000:
> Here's a set of patches to convert netfs, 9p and afs to use folios and to
> provide sufficient conversion for ceph that it can continue to use the
> netfs library.  Jeff Layton is working on fully converting ceph.
> 
> This has been rebased on to the 9p merge in Linus's tree[5] so that it has
> access to both the 9p conversion to fscache and folios.

Ran basic tests on 9p with this; it'd probably deserve a bit more
soak-in but at least doesn't seem to break anything obvious:
(Re-)Tested-by: Dominique Martinet <asmadeus@codewreck.org>

-- 
Dominique

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

