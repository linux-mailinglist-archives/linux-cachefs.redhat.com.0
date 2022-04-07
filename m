Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 096604F88C2
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Apr 2022 23:22:22 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-nsr0RGgTPByrRW0Iu34cwg-1; Thu, 07 Apr 2022 17:22:19 -0400
X-MC-Unique: nsr0RGgTPByrRW0Iu34cwg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 672C61C04B48;
	Thu,  7 Apr 2022 21:22:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F7DA434846;
	Thu,  7 Apr 2022 21:22:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AC03C1940342;
	Thu,  7 Apr 2022 21:22:13 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7E6401949761 for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 21:22:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 472D840D2962; Thu,  7 Apr 2022 21:22:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4312240D284F
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 21:22:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29A9C811E76
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 21:22:12 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-9CoLaKrtMdS7yiaZjP7c_A-1; Thu, 07 Apr 2022 17:22:10 -0400
X-MC-Unique: 9CoLaKrtMdS7yiaZjP7c_A-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1ncZZv-009Ciz-Cj; Thu, 07 Apr 2022 21:22:07 +0000
Date: Thu, 7 Apr 2022 22:22:07 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <Yk9V/03wgdYi65Lb@casper.infradead.org>
References: <Yk5W6zvvftOB+80D@casper.infradead.org>
 <164928615045.457102.10607899252434268982.stgit@warthog.procyon.org.uk>
 <164928630577.457102.8519251179327601178.stgit@warthog.procyon.org.uk>
 <469869.1649313707@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <469869.1649313707@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [Linux-cachefs] [PATCH 14/14] mm, netfs,
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
 Rohith Surabattula <rohiths.msft@gmail.com>, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>, linux-mm@kvack.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 07, 2022 at 07:41:47AM +0100, David Howells wrote:
> Matthew Wilcox <willy@infradead.org> wrote:
> 
> > On Thu, Apr 07, 2022 at 12:05:05AM +0100, David Howells wrote:
> > > Fix this by adding an extra address_space operation, ->removing folio(),
> > > and flag, AS_NOTIFY_REMOVING_FOLIO.  The operation is called if the flag is
> > > set when a folio is removed from the pagecache.  The flag should be set if
> > > a non-NULL cookie is obtained from fscache and cleared in ->evict_inode()
> > > before truncate_inode_pages_final() is called.
> > 
> > What's wrong with ->freepage?
> 
> It's too late.  The optimisation must be cancelled before there's a chance
> that a new page can be allocated and attached to the pagecache - but
> ->freepage() is called after the folio has been removed.  Doing it in
> ->freepage() would allow ->readahead(), ->readpage() or ->write_begin() to
> jump in and start a new read (which gets skipped because the optimisation is
> still in play).

OK.  You suggested that releasepage was an acceptable place to call it.
How about we have AS_RELEASE_ALL (... or something ...) and then
page_has_private() becomes a bit more complicated ... to the point
where we should probably get rid of it (by embedding it into
filemap_release_folio():

+++ b/mm/filemap.c
@@ -3981,6 +3981,9 @@ bool filemap_release_folio(struct folio *folio, gfp_t gfp)
        struct address_space * const mapping = folio->mapping;

        BUG_ON(!folio_test_locked(folio));
+       if (!mapping_needs_release(mapping) && !folio_test_private(folio) &&
+           !folio_test_private_2(folio))
+               return false;
        if (folio_test_writeback(folio))
                return false;



--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

