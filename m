Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 30256629119
	for <lists+linux-cachefs@lfdr.de>; Tue, 15 Nov 2022 05:09:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668485367;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IuGzDXYmsq6WJGtctVcKaomVv42LOuL3UvvHf0WVbVQ=;
	b=UloRmVYHPLIaQ3k73qqRcEmPSf4h5msBUz+/SRzV50U0fSn+WeiC0mECRfZsJNGjPSBgxv
	UKaPPkWAf8OA032psC3xe0jzSQTJU90LGlzBX0iQvhTfSsBAwL/bevIg+CRatHiqI1EXP7
	Fe71DAx8UTazrQadTEFN9TL7fP8UwYA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-QQG6aoP5OGiTNAGNkI8Uyg-1; Mon, 14 Nov 2022 23:09:24 -0500
X-MC-Unique: QQG6aoP5OGiTNAGNkI8Uyg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E29E72999B20;
	Tue, 15 Nov 2022 04:09:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A37402028DC1;
	Tue, 15 Nov 2022 04:09:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1B344194658F;
	Tue, 15 Nov 2022 04:09:20 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1444E1946589 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 15 Nov 2022 04:09:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0241A2166B41; Tue, 15 Nov 2022 04:09:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF3352166B2B
 for <linux-cachefs@redhat.com>; Tue, 15 Nov 2022 04:09:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0CFB2999B20
 for <linux-cachefs@redhat.com>; Tue, 15 Nov 2022 04:09:18 +0000 (UTC)
Received: from casper.infradead.org (90.155.50.34 [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-500-6rF4pub_MDSvMryOprasWA-1; Mon,
 14 Nov 2022 23:09:16 -0500
X-MC-Unique: 6rF4pub_MDSvMryOprasWA-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1ounFy-00G84y-Gg; Tue, 15 Nov 2022 04:09:06 +0000
Date: Tue, 15 Nov 2022 04:09:06 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <Y3MQ4l1AJOgniprT@casper.infradead.org>
References: <166844174069.1124521.10890506360974169994.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <166844174069.1124521.10890506360974169994.stgit@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Linux-cachefs] [RFC PATCH v2] mm, netfs,
 fscache: Stop read optimisation when folio removed from pagecache
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
 linux-nfs@vger.kernel.org, Rohith Surabattula <rohiths.msft@gmail.com>,
 ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
 linux-mm@kvack.org, linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
 Dominique Martinet <asmadeus@codewreck.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 14, 2022 at 04:02:20PM +0000, David Howells wrote:
> +++ b/mm/filemap.c
> @@ -3941,6 +3941,10 @@ bool filemap_release_folio(struct folio *folio, gfp_t gfp)
>  	struct address_space * const mapping = folio->mapping;
>  
>  	BUG_ON(!folio_test_locked(folio));
> +	if ((!mapping || !mapping_release_always(mapping))
> +	    && !folio_test_private(folio) &&
> +	    !folio_test_private_2(folio))
> +		return true;

Why do you need to test 'mapping' here?  Also this is the most
inconsistent style ...

	if ((!mapping || !mapping_release_always(mapping)) &&
	    !folio_test_private(folio) && !folio_test_private_2(folio))

works fine, but if you insist on splitting over three lines, then:

	if ((!mapping || !mapping_release_always(mapping)) &&
	    !folio_test_private(folio) && 
	    !folio_test_private_2(folio))

> @@ -276,7 +275,7 @@ static long mapping_evict_folio(struct address_space *mapping,
>  	if (folio_ref_count(folio) >
>  			folio_nr_pages(folio) + folio_has_private(folio) + 1)

I think this line is incorrect, right?  You don't increment the folio
refcount just because the folio has private2 set, do you?

>  		return 0;
> -	if (folio_has_private(folio) && !filemap_release_folio(folio, 0))
> +	if (!filemap_release_folio(folio, 0))
>  		return 0;
>  
>  	return remove_mapping(mapping, folio);

Can we get rid of folio_has_private() / page_has_private() now?

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

