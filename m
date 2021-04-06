Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4EE355696
	for <lists+linux-cachefs@lfdr.de>; Tue,  6 Apr 2021 16:26:35 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-tkUIHZG5PcueBL5-Kd02rw-1; Tue, 06 Apr 2021 10:26:32 -0400
X-MC-Unique: tkUIHZG5PcueBL5-Kd02rw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BEA9CC62C;
	Tue,  6 Apr 2021 14:26:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 087395C729;
	Tue,  6 Apr 2021 14:26:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF3061800232;
	Tue,  6 Apr 2021 14:26:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 136EOZN1016105 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 6 Apr 2021 10:24:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5B51D7D283; Tue,  6 Apr 2021 14:24:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55DE272916
	for <linux-cachefs@redhat.com>; Tue,  6 Apr 2021 14:24:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6D9B8032E6
	for <linux-cachefs@redhat.com>; Tue,  6 Apr 2021 14:24:31 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-558-DKnlWc8LOSiJ_bO2v8OsUg-1; Tue, 06 Apr 2021 10:24:30 -0400
X-MC-Unique: DKnlWc8LOSiJ_bO2v8OsUg-1
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lTmbs-00Cvj3-2f; Tue, 06 Apr 2021 14:23:22 +0000
Date: Tue, 6 Apr 2021 15:23:16 +0100
From: Christoph Hellwig <hch@infradead.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <20210406142316.GY3062550@infradead.org>
References: <20210331184728.1188084-1-willy@infradead.org>
	<20210331184728.1188084-27-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210331184728.1188084-27-willy@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH v6 26/27] mm/filemap: Convert
 wake_up_page_bit to wake_up_folio_bit
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

On Wed, Mar 31, 2021 at 07:47:27PM +0100, Matthew Wilcox (Oracle) wrote:
>  void unlock_page_private_2(struct page *page)
>  {
> -	page = compound_head(page);
> -	VM_BUG_ON_PAGE(!PagePrivate2(page), page);
> -	clear_bit_unlock(PG_private_2, &page->flags);
> -	wake_up_page_bit(page, PG_private_2);
> +	struct folio *folio = page_folio(page);
> +	VM_BUG_ON_FOLIO(!FolioPrivate2(folio), folio);

A whitespace between the declaration and the code would be nice.

Otherwise looks good;

Reviewed-by: Christoph Hellwig <hch@lst.de>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

