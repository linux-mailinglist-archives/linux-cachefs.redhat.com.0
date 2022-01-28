Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B5149F039
	for <lists+linux-cachefs@lfdr.de>; Fri, 28 Jan 2022 01:58:21 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-6MHgHBq6P129WALUhJRxUA-1; Thu, 27 Jan 2022 19:58:17 -0500
X-MC-Unique: 6MHgHBq6P129WALUhJRxUA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88CE51853020;
	Fri, 28 Jan 2022 00:58:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A8B35DBB6;
	Fri, 28 Jan 2022 00:58:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 13E921809CB8;
	Fri, 28 Jan 2022 00:58:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20S0wCNg028302 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 27 Jan 2022 19:58:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8C4B1C07F3F; Fri, 28 Jan 2022 00:58:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 883A2C159B3
	for <linux-cachefs@redhat.com>; Fri, 28 Jan 2022 00:58:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FA44101A54C
	for <linux-cachefs@redhat.com>; Fri, 28 Jan 2022 00:58:12 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-628-S6ud_mePORi8-5wCGrHryw-1; Thu, 27 Jan 2022 19:58:10 -0500
X-MC-Unique: S6ud_mePORi8-5wCGrHryw-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1nDFaY-005q2k-AJ; Fri, 28 Jan 2022 00:58:06 +0000
Date: Fri, 28 Jan 2022 00:58:06 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Steve French <smfrench@gmail.com>
Message-ID: <YfM/ngiPN5wkwjii@casper.infradead.org>
References: <164329930161.843658.7387773437540491743.stgit@warthog.procyon.org.uk>
	<164329937835.843658.13129382687019174242.stgit@warthog.procyon.org.uk>
	<CAH2r5mu4FeX2x=Xd0jDnQopTfhOBP_P91-NH-A+bNdx6THCu8A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH2r5mu4FeX2x=Xd0jDnQopTfhOBP_P91-NH-A+bNdx6THCu8A@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: linux-cachefs@redhat.com
Cc: Shyam Prasad N <nspmangalore@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, linux-cachefs@redhat.com,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [Linux-cachefs] [PATCH 4/4] cifs: Implement cache I/O by
 accessing the cache directly
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 27, 2022 at 06:55:23PM -0600, Steve French wrote:
> Regression tests so far on Dave's cifs fscache patch series are going
> fine.  First series of tests I ran were this:
> http://smb3-test-rhel-75.southcentralus.cloudapp.azure.com/#/builders/11/builds/160
> but I have to run additional tests with fscache enabled etc.
> 
> I saw that checkpatch had some minor complaints on this patch (patch
> 4) which I cleaned up, but was wondering other's thoughts on this
> checkpatch warning:
> 
> WARNING: Avoid crashing the kernel - try using WARN_ON & recovery code
> rather than BUG() or BUG_ON()
> #101: FILE: fs/cifs/file.c:4449:
> 
> ie
> 
> + page = readahead_page(ractl);
> + BUG_ON(!page);

Just remove it.  The kernel will crash just fine without putting in an
explicit BUG_ON, and it'll be obvious what the problem is.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

