Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A452032284F
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Feb 2021 10:59:50 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-rlEC502EMJe0dGqvWy5yKA-1; Tue, 23 Feb 2021 04:59:47 -0500
X-MC-Unique: rlEC502EMJe0dGqvWy5yKA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19F7A835E20;
	Tue, 23 Feb 2021 09:59:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08C1662953;
	Tue, 23 Feb 2021 09:59:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E578918095CB;
	Tue, 23 Feb 2021 09:59:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11GAR7ts019435 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 16 Feb 2021 05:27:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 77D6F203870A; Tue, 16 Feb 2021 10:27:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7393B2038709
	for <linux-cachefs@redhat.com>; Tue, 16 Feb 2021 10:27:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62761100AFE0
	for <linux-cachefs@redhat.com>; Tue, 16 Feb 2021 10:27:04 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-96-a0wImmSyOj6CynwbE_rhUQ-1;
	Tue, 16 Feb 2021 05:27:02 -0500
X-MC-Unique: a0wImmSyOj6CynwbE_rhUQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id EDE4F67373; Tue, 16 Feb 2021 11:26:59 +0100 (CET)
Date: Tue, 16 Feb 2021 11:26:59 +0100
From: Christoph Hellwig <hch@lst.de>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210216102659.GA27714@lst.de>
References: <161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
	<161340387944.1303470.7944159520278177652.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <161340387944.1303470.7944159520278177652.stgit@warthog.procyon.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
X-Mailman-Approved-At: Tue, 23 Feb 2021 04:59:26 -0500
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Christoph Hellwig <hch@lst.de>, Steve French <sfrench@samba.org>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 02/33] mm: Add an unlock function for
 PG_private_2/PG_fscache
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> +extern void unlock_page_private_2(struct page *page);

No need for the extern.

Otherwise this looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

