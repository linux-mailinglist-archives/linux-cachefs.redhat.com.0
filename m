Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F80D722184
	for <lists+linux-cachefs@lfdr.de>; Mon,  5 Jun 2023 10:56:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685955388;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ukb7f/CFhtYrRJA7hUh5BF2BsmsHDzDeZeUkz03wKDY=;
	b=VvHxjecb4hBkFkCNNiNDLTmNY66xar8d6d71A35XGIDqWQf29lt8CNxBRu3FFE/a8pUpcp
	yQjez9Gsi4QB+GcTgqqh1In5V8fv59yBqFYOi90oBCrZ8ohBndMUtAQqOVM1IyagmmHWo5
	la51CnrSJnWmS8Ob8S7TKWWsCKtU8IU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-bOjH1sSCMay-k7PaqZV8LA-1; Mon, 05 Jun 2023 04:56:25 -0400
X-MC-Unique: bOjH1sSCMay-k7PaqZV8LA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C0A28032E4;
	Mon,  5 Jun 2023 08:56:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A36B69E72;
	Mon,  5 Jun 2023 08:56:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0D3FE19465A3;
	Mon,  5 Jun 2023 08:56:23 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8B3111946595 for <linux-cachefs@listman.corp.redhat.com>;
 Mon,  5 Jun 2023 08:56:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6C2CE2166B27; Mon,  5 Jun 2023 08:56:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63A122166B25
 for <linux-cachefs@redhat.com>; Mon,  5 Jun 2023 08:56:21 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 480E8101A531
 for <linux-cachefs@redhat.com>; Mon,  5 Jun 2023 08:56:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-1bByh_MOPe66CDrh5f7Ssw-1; Mon, 05 Jun 2023 04:56:19 -0400
X-MC-Unique: 1bByh_MOPe66CDrh5f7Ssw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 03F5260FA3;
 Mon,  5 Jun 2023 08:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98999C433EF;
 Mon,  5 Jun 2023 08:56:16 +0000 (UTC)
From: Christian Brauner <brauner@kernel.org>
To: David Howells <dhowells@redhat.com>
Date: Mon,  5 Jun 2023 10:56:07 +0200
Message-Id: <20230605-baumhaus-niemals-e54f42ee6697@brauner>
In-Reply-To: <1853230.1684516880@warthog.procyon.org.uk>
References: <1853230.1684516880@warthog.procyon.org.uk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=993; i=brauner@kernel.org;
 h=from:subject:message-id; bh=EvMjOmcR0DzI75LU8ZbEStkGi2bPjEetDmC8ubTy+uM=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaTULlbM+6vXPafMzOrp0XPGZ58pzNSOPTG1mDs8LHBV9Rbj
 D4lJHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABP5/Inhf4Cse+Oh38YBL09NOcATlJ
 0ZzuxlkmOZcTDpw5KjewykzjD84c+OfJS6ZYfoj/QlC5cffj2Je6bXqnKFC3PzytRbWJ/X8wIA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Linux-cachefs] [PATCH] cachefiles: Allow the cache to be
 non-root
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
Cc: Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 19 May 2023 18:21:20 +0100, David Howells wrote:
> 
> Set mode 0600 on files in the cache so that cachefilesd can run as an
> unprivileged user rather than leaving the files all with 0.  Directories
> are already set to 0700.
> 
> Userspace then needs to set the uid and gid before issuing the "bind"
> command and the cache must've been chown'd to those IDs.
> 
> [...]

Applied to the vfs.misc branch of the vfs/vfs.git tree.
Patches in the vfs.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.misc

[1/1] cachefiles: Allow the cache to be non-root
      https://git.kernel.org/vfs/vfs/c/a64498ff493f

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

