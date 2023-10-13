Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E017C8C94
	for <lists+linux-cachefs@lfdr.de>; Fri, 13 Oct 2023 19:50:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697219439;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TQv0L1fYCns6nYlqTL4J4yduxsqpGQifRTbC7GXmxHQ=;
	b=SIhiyVw4JU+5+wXCksVyjrT6iQ0Pff7UhqMd/wWMucK0n36fsnIBIjFjwHhDuCcdnTanem
	0wXSezP0Oc05Z+VbAvqZPFjNmXPqJqNqYbdQgm+RyZpWa5ZW5Z/Qdq7FuyLwqaJVAisYir
	ERvskOW/Z9VwT8g8XP6NWFFdFrXxvq0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-PvhAYp7PPs-FGhmTtSEOmA-1; Fri, 13 Oct 2023 13:50:36 -0400
X-MC-Unique: PvhAYp7PPs-FGhmTtSEOmA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 962B01C01524;
	Fri, 13 Oct 2023 17:50:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B424B25C0;
	Fri, 13 Oct 2023 17:50:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 85CB81946589;
	Fri, 13 Oct 2023 17:50:34 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 45C551946586 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 13 Oct 2023 17:50:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 078C040C6CA0; Fri, 13 Oct 2023 17:50:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00B3440C6F79
 for <linux-cachefs@redhat.com>; Fri, 13 Oct 2023 17:50:32 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1B123C0C132
 for <linux-cachefs@redhat.com>; Fri, 13 Oct 2023 17:50:32 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-497-hXywFiBcMfKeliY8uAaqjg-1; Fri,
 13 Oct 2023 13:50:31 -0400
X-MC-Unique: hXywFiBcMfKeliY8uAaqjg-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qrLwx-006d2F-Oz; Fri, 13 Oct 2023 17:27:47 +0000
Date: Fri, 13 Oct 2023 18:27:47 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <ZSl+Ezh3Av3LLyEf@casper.infradead.org>
References: <20231013160423.2218093-1-dhowells@redhat.com>
 <20231013160423.2218093-13-dhowells@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20231013160423.2218093-13-dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Subject: Re: [Linux-cachefs] [RFC PATCH 12/53] netfs: Provide tools to
 create a buffer in an xarray
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Paulo Alcantara <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 Shyam Prasad N <sprasad@microsoft.com>, v9fs@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
 Jeff Layton <jlayton@kernel.org>, linux-nfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tom Talpey <tom@talpey.com>,
 Steve French <smfrench@gmail.com>, linux-cachefs@redhat.com,
 linux-mm@kvack.org, netdev@vger.kernel.org,
 Marc Dionne <marc.dionne@auristor.com>, ceph-devel@vger.kernel.org,
 Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org,
 Christian Brauner <christian@brauner.io>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 13, 2023 at 05:03:41PM +0100, David Howells wrote:
> +int netfs_xa_store_and_mark(struct xarray *xa, unsigned long index,
> +			    struct folio *folio, bool put_mark,
> +			    bool pagecache_mark, gfp_t gfp_mask);

Linus has been unhappy recently with functions that take two bools.
When you're reading the caller, you see:

	netfs_xa_store_and_mark(xa, index, true, false, GFP_FOO);

and you don't know instantly what true and false mean.  He prefers

#define NETFS_FLAG_PUT		(1 << 0)
#define NETFS_FLAG_PAGECACHE	(1 << 1)

and then the caller looks like:

	netfs_xa_store_and_mark(xa, index, NETFS_FLAG_PUT, GFP_FOO);

and you know exactly what it's doing.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

