Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3858639B83D
	for <lists+linux-cachefs@lfdr.de>; Fri,  4 Jun 2021 13:46:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-5b_49laWNMa-8mQ6T2jmMg-1; Fri, 04 Jun 2021 07:46:45 -0400
X-MC-Unique: 5b_49laWNMa-8mQ6T2jmMg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF11E8015C6;
	Fri,  4 Jun 2021 11:46:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FACB5C239;
	Fri,  4 Jun 2021 11:46:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 475B31800BB8;
	Fri,  4 Jun 2021 11:46:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 154BkcWL018671 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 4 Jun 2021 07:46:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 29A8B212AA95; Fri,  4 Jun 2021 11:46:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25446212AA99
	for <linux-cachefs@redhat.com>; Fri,  4 Jun 2021 11:46:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D256B85828E
	for <linux-cachefs@redhat.com>; Fri,  4 Jun 2021 11:46:35 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-562-LZyjiD7PM4u4_KIWh4DPsw-1;
	Fri, 04 Jun 2021 07:46:34 -0400
X-MC-Unique: LZyjiD7PM4u4_KIWh4DPsw-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89797611ED;
	Fri,  4 Jun 2021 11:36:41 +0000 (UTC)
Date: Fri, 4 Jun 2021 13:36:39 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210604113639.qlgn3nvc6iqlgner@wittgenstein>
References: <162280352566.3319242.10615341893991206961.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <162280352566.3319242.10615341893991206961.stgit@warthog.procyon.org.uk>
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
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH] fscache: Select netfs stats if fscache
	stats are enabled
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

On Fri, Jun 04, 2021 at 11:45:25AM +0100, David Howells wrote:
> Unconditionally select the stats produced by the netfs lib if fscache stats
> are enabled as the former are displayed in the latter's procfile.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: linux-cachefs@redhat.com
> ---

That's helpful, thanks
Acked-by: Christian Brauner <christian.brauner@ubuntu.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

