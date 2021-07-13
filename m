Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA703C7004
	for <lists+linux-cachefs@lfdr.de>; Tue, 13 Jul 2021 13:54:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-7ieasxz9MxiyY43Bu69FIw-1; Tue, 13 Jul 2021 07:54:55 -0400
X-MC-Unique: 7ieasxz9MxiyY43Bu69FIw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0CCB81C862;
	Tue, 13 Jul 2021 11:54:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64A0A5DA60;
	Tue, 13 Jul 2021 11:54:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 782FA1809C99;
	Tue, 13 Jul 2021 11:54:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16DBsjmN013310 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 13 Jul 2021 07:54:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EF2D5110DBAA; Tue, 13 Jul 2021 11:54:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA7C7110DBA2
	for <linux-cachefs@redhat.com>; Tue, 13 Jul 2021 11:54:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2C33800963
	for <linux-cachefs@redhat.com>; Tue, 13 Jul 2021 11:54:41 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-52-PnoM-7SwNduxg1D6xmBZFQ-1; 
	Tue, 13 Jul 2021 07:54:39 -0400
X-MC-Unique: PnoM-7SwNduxg1D6xmBZFQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5879161073;
	Tue, 13 Jul 2021 11:54:37 +0000 (UTC)
Message-ID: <f36adf661f37582b51b05c9d8d0a41ea60812b68.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Christoph Hellwig <hch@infradead.org>, David Howells <dhowells@redhat.com>
Date: Tue, 13 Jul 2021 07:54:36 -0400
In-Reply-To: <YO0oJvuIXlcmSd7F@infradead.org>
References: <162609279295.3129635.5721010331369998019.stgit@warthog.procyon.org.uk>
	<YO0oJvuIXlcmSd7F@infradead.org>
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34)
MIME-Version: 1.0
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
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	torvalds@linux-foundation.org, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH] netfs: Add MAINTAINERS record
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

On Tue, 2021-07-13 at 06:44 +0100, Christoph Hellwig wrote:
> On Mon, Jul 12, 2021 at 01:26:32PM +0100, David Howells wrote:
> > Add a MAINTAINERS record for the new netfs helper library.
> 
> Btw, any reason why this code is called netfs?  It is a library
> that seems to mostly be glue code for fscache as far as I can tell and
> has nothing to do with networking at all.

It's infrastructure for network filesystems.

The original impetus was hooking up fscache, though the helper code also
works with fscache disabled. We also have some work in progress to plumb
in fscrypt support, and David is also looking at adding
writepage/writepages support too.

readpage/readpages/writepage/writepages operations in network
filesystems are quite "fiddly", and they all do it in subtly different
ways (and not always for good reasons).

The new read helper infrastructure abstracts a lot of that away, and
gives netfs's a simpler set of operations to deal with. We're hoping to
do the same with writepage/writepages helpers soon.
-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

