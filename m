Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3678574B695
	for <lists+linux-cachefs@lfdr.de>; Fri,  7 Jul 2023 20:44:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688755486;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eYEovCKLWHlCzJdgCnWWbX+Ou7cgOjFRf0TvuNzACOU=;
	b=NaFt59yjrY8cuH87CwpeRGmL2Hty2+WUVGBRnSAr6ouaZIb0JckogJ3bEQJMOeS8U8bFEd
	9sq8tZmkwdmDd6jO+JYA6k9Zqr3+vtKalfAi2IDupautbSFZwPeLPSlFlu7FjKeiJ6Aowk
	kJn8/4uVzXPPzPlHyX21Vme9ddYhENU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-CrbcNv8VMturTwSs9zrzDw-1; Fri, 07 Jul 2023 14:44:42 -0400
X-MC-Unique: CrbcNv8VMturTwSs9zrzDw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1AF21039655;
	Fri,  7 Jul 2023 18:44:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AB21DF643A;
	Fri,  7 Jul 2023 18:44:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 764D31946A61;
	Fri,  7 Jul 2023 18:44:41 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1E70C1946A54 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  7 Jul 2023 18:44:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DFCE9C478DE; Fri,  7 Jul 2023 18:44:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D78EBC09A09
 for <linux-cachefs@redhat.com>; Fri,  7 Jul 2023 18:44:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1A2438294A4
 for <linux-cachefs@redhat.com>; Fri,  7 Jul 2023 18:44:39 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647-XJ6Adlr7Ob2WEmcgoPOBVQ-1; Fri,
 07 Jul 2023 14:44:38 -0400
X-MC-Unique: XJ6Adlr7Ob2WEmcgoPOBVQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qHqGZ-00CFvk-6N; Fri, 07 Jul 2023 18:33:15 +0000
Date: Fri, 7 Jul 2023 19:33:15 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Wysochanski <dwysocha@redhat.com>
Message-ID: <ZKhaa7xn9aaZYicR@casper.infradead.org>
References: <20230628104852.3391651-1-dhowells@redhat.com>
 <20230628104852.3391651-3-dhowells@redhat.com>
 <ZKg/J3OG3kQ9ynSO@fedora>
 <CAB=+i9Qbi7+o90Cd_ecd1TeaAYnWPcO-gNp7kzc95Pxecy0XTw@mail.gmail.com>
 <CALF+zO=nGdoxcT-ya3aaUCBi-4iKPo3kZyzcWYCKMCf4n2wVbA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALF+zO=nGdoxcT-ya3aaUCBi-4iKPo3kZyzcWYCKMCf4n2wVbA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-afs@lists.infradead.org,
 Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-cachefs@redhat.com,
 v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, Rohith Surabattula <rohiths.msft@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, Steve French <sfrench@samba.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 07, 2023 at 02:12:06PM -0400, David Wysochanski wrote:
> I think myself / Daire Byrne may have already tracked this down and I
> found a 1-liner that fixed a similar crash in his environment.
> 
> Can you try this patch on top and let me know if it still crashes?
> https://github.com/DaveWysochanskiRH/kernel/commit/902c990e311120179fa5de99d68364b2947b79ec

Said one-liner:
-	struct address_space *mapping = folio->mapping;
+	struct address_space *mapping = folio_mapping(folio);

This will definitely fix the problem.  shrink_folio_list() sees
anonymous folios as well as file folios.

I wonder if we want to go a step further and introduce ...

+static inline bool __folio_needs_release(struct address_space *mapping,
+               struct folio *folio)
+{
+       return folio_has_private(folio) ||
+               (mapping && mapping_release_always(mapping));
+}
+
 /*
  * Return true if a folio needs ->release_folio() calling upon it.
  */
 static inline bool folio_needs_release(struct folio *folio)
 {
-       struct address_space *mapping = folio->mapping;
-
-       return folio_has_private(folio) ||
-               (mapping && mapping_release_always(mapping));
+       return __folio_needs_release(folio_mapping(folio), folio);
 }

since two of the three callers already have done the necessary dance to
get the mapping (and they're the two which happen regularly; the third
is an unusual situation).

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

