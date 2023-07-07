Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C6374B678
	for <lists+linux-cachefs@lfdr.de>; Fri,  7 Jul 2023 20:40:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688755239;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wke5jm9gLMp03t3LjDEx2iimANrCClBMwptZkmaF2io=;
	b=c3fJIPETB4oM1HCZP4nlMEuqlO8dXZ9NMnLNo7NAkYykJwcAh+SUOx19OzJ1YLe+pxDCLP
	nuxcukctIAzSzNvegECXvECQanzhz/AqcoLuFthvqHw6kj14n44Sk7J3/SprqebBgDly4o
	uhY6tageaeXhKWEFnFs2r0/+7l7j9HU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-_2QMicy4N0yqItm6xvkD8w-1; Fri, 07 Jul 2023 14:40:36 -0400
X-MC-Unique: _2QMicy4N0yqItm6xvkD8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 930EA800159;
	Fri,  7 Jul 2023 18:40:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 889271121330;
	Fri,  7 Jul 2023 18:40:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 27BF01946A61;
	Fri,  7 Jul 2023 18:40:35 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F2F2F1946A54 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  7 Jul 2023 18:40:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C27144CD0C8; Fri,  7 Jul 2023 18:40:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB598492C13
 for <linux-cachefs@redhat.com>; Fri,  7 Jul 2023 18:40:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A022D3C0F682
 for <linux-cachefs@redhat.com>; Fri,  7 Jul 2023 18:40:33 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-584-w1apyBTxOBiWcSyKiFI1tw-1; Fri,
 07 Jul 2023 14:40:31 -0400
X-MC-Unique: w1apyBTxOBiWcSyKiFI1tw-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qHqNQ-00CGGh-H0; Fri, 07 Jul 2023 18:40:20 +0000
Date: Fri, 7 Jul 2023 19:40:20 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Message-ID: <ZKhcFE1JpT6F2ez3@casper.infradead.org>
References: <20230628104852.3391651-1-dhowells@redhat.com>
 <20230628104852.3391651-3-dhowells@redhat.com>
 <ZKg/J3OG3kQ9ynSO@fedora>
 <CAB=+i9Qbi7+o90Cd_ecd1TeaAYnWPcO-gNp7kzc95Pxecy0XTw@mail.gmail.com>
 <CALF+zO=nGdoxcT-ya3aaUCBi-4iKPo3kZyzcWYCKMCf4n2wVbA@mail.gmail.com>
 <ZKhZHg6LSGnvryIe@fedora>
MIME-Version: 1.0
In-Reply-To: <ZKhZHg6LSGnvryIe@fedora>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Linux-cachefs] [BUG mm-unstable] BUG: KASAN: use-after-free in
 shrink_folio_list+0x9f4/0x1ae0
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
Cc: Dominique Martinet <asmadeus@codewreck.org>, linux-mm@kvack.org,
 linux-afs@lists.infradead.org, Shyam Prasad N <nspmangalore@gmail.com>,
 linux-cifs@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-cachefs@redhat.com,
 v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, Rohith Surabattula <rohiths.msft@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, Steve French <sfrench@samba.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 08, 2023 at 03:27:42AM +0900, Hyeonggon Yoo wrote:
> Hmm, was it UAF because it references wrong field ->mapping,
> instead of swapper address space?

Ooh, I know this one!

When a folio is in use as an anonymous page, ->mapping has the bottom
two bits set to 01b.  The rest of the pointer is actually a pointer
to an anon_vma.  It's entirely plausible that an anon page might have
had its anon_vma freed by the time the folio is on the inactive list,
and on its way to being recycled (eg it was unmapped).  I'm not
terribly familiar with the lifetime rules of the anon_vma, but I doubt
that a folio still being in RAM would pin it if it has been unmapped.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

