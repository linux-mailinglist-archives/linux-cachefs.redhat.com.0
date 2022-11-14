Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 796B6628B56
	for <lists+linux-cachefs@lfdr.de>; Mon, 14 Nov 2022 22:27:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668461226;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=V7DtN5A3/SPT9BA0JUP22yaIiZYMEQH10Ts8Je0Js/Y=;
	b=VXRC50auk7GNdY6J66poS15RQKAmEnni5RiIGkhJiJR85KvztBOg/Wc0o1iroXhHovN2bE
	2fU9yBn9+PvK8BDHEO0JtjNFnKs7yy21jmgQN3n6qz+oDxh1whUrAey1DVJEpfM1JFkeuq
	XVci4qW2RgEPrbMrDUIPm7RLyGdfE/Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-ZiqRvbmONjq3D81xvNej-A-1; Mon, 14 Nov 2022 16:27:03 -0500
X-MC-Unique: ZiqRvbmONjq3D81xvNej-A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 954DB3C0E45E;
	Mon, 14 Nov 2022 21:27:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C72B40CA40C;
	Mon, 14 Nov 2022 21:27:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 630B9194658F;
	Mon, 14 Nov 2022 21:27:02 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5D0711946589 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 14 Nov 2022 21:27:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 496B749BB61; Mon, 14 Nov 2022 21:27:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41BBB49BB60
 for <linux-cachefs@redhat.com>; Mon, 14 Nov 2022 21:27:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25F4186F12F
 for <linux-cachefs@redhat.com>; Mon, 14 Nov 2022 21:27:01 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-PoOHcWneOWiL7RycURuayQ-1; Mon, 14 Nov 2022 16:26:59 -0500
X-MC-Unique: PoOHcWneOWiL7RycURuayQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 61360B81253;
 Mon, 14 Nov 2022 21:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C699C433B5;
 Mon, 14 Nov 2022 21:26:55 +0000 (UTC)
Message-ID: <39851a8767b32c495c6b9146a601c37f28645466.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, willy@infradead.org
Date: Mon, 14 Nov 2022 16:26:54 -0500
In-Reply-To: <166757988611.950645.7626959069846893164.stgit@warthog.procyon.org.uk>
References: <166757987929.950645.12595273010425381286.stgit@warthog.procyon.org.uk>
 <166757988611.950645.7626959069846893164.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Linux-cachefs] [PATCH v2 2/2] netfs: Fix dodgy maths
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
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2022-11-04 at 16:38 +0000, David Howells wrote:
> Fix the dodgy maths in netfs_rreq_unlock_folios().  start_page could be
> inside the folio, in which case the calculation of pgpos will be come up
> with a negative number (though for the moment rreq->start is rounded down
> earlier and folios would have to get merged whilst locked)
> 
> Alter how this works to just frame the tracking in terms of absolute file
> positions, rather than offsets from the start of the I/O request.  This
> simplifies the maths and makes it easier to follow.
> 
> Fix the issue by using folio_pos() and folio_size() to calculate the end
> position of the page.
> 
> Fixes: 3d3c95046742 ("netfs: Provide readahead and readpage netfs helpers")
> Reported-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jeff Layton <jlayton@kernel.org>
> cc: linux-cachefs@redhat.com
> cc: linux-fsdevel@vger.kernel.org
> Link: https://lore.kernel.org/r/Y2SJw7w1IsIik3nb@casper.infradead.org/
> ---
> 
>  fs/netfs/buffered_read.c |   17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
> index baf668fb4315..7679a68e8193 100644
> --- a/fs/netfs/buffered_read.c
> +++ b/fs/netfs/buffered_read.c
> @@ -17,9 +17,9 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
>  {
>  	struct netfs_io_subrequest *subreq;
>  	struct folio *folio;
> -	unsigned int iopos, account = 0;
>  	pgoff_t start_page = rreq->start / PAGE_SIZE;
>  	pgoff_t last_page = ((rreq->start + rreq->len) / PAGE_SIZE) - 1;
> +	size_t account = 0;
>  	bool subreq_failed = false;
>  
>  	XA_STATE(xas, &rreq->mapping->i_pages, start_page);
> @@ -39,23 +39,23 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
>  	 */
>  	subreq = list_first_entry(&rreq->subrequests,
>  				  struct netfs_io_subrequest, rreq_link);
> -	iopos = 0;
>  	subreq_failed = (subreq->error < 0);
>  
>  	trace_netfs_rreq(rreq, netfs_rreq_trace_unlock);
>  
>  	rcu_read_lock();
>  	xas_for_each(&xas, folio, last_page) {
> -		unsigned int pgpos, pgend;
> +		loff_t pg_end;
>  		bool pg_failed = false;
>  
>  		if (xas_retry(&xas, folio))
>  			continue;
>  
> -		pgpos = (folio_index(folio) - start_page) * PAGE_SIZE;
> -		pgend = pgpos + folio_size(folio);
> +		pg_end = folio_pos(folio) + folio_size(folio) - 1;
>  
>  		for (;;) {
> +			loff_t sreq_end;
> +
>  			if (!subreq) {
>  				pg_failed = true;
>  				break;
> @@ -63,11 +63,11 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
>  			if (test_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags))
>  				folio_start_fscache(folio);
>  			pg_failed |= subreq_failed;
> -			if (pgend < iopos + subreq->len)
> +			sreq_end = subreq->start + subreq->len - 1;
> +			if (pg_end < sreq_end)
>  				break;
>  
>  			account += subreq->transferred;
> -			iopos += subreq->len;
>  			if (!list_is_last(&subreq->rreq_link, &rreq->subrequests)) {
>  				subreq = list_next_entry(subreq, rreq_link);
>  				subreq_failed = (subreq->error < 0);
> @@ -75,7 +75,8 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
>  				subreq = NULL;
>  				subreq_failed = false;
>  			}
> -			if (pgend == iopos)
> +
> +			if (pg_end == sreq_end)
>  				break;
>  		}
>  
> 
> 
> --
> Linux-cachefs mailing list
> Linux-cachefs@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-cachefs
> 

Reviewed-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

