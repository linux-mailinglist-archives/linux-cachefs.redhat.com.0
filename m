Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D76B147DAB
	for <lists+linux-cachefs@lfdr.de>; Mon, 17 Jun 2019 10:54:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9297181DF5;
	Mon, 17 Jun 2019 08:54:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62221341EA;
	Mon, 17 Jun 2019 08:54:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E90A01806B0F;
	Mon, 17 Jun 2019 08:54:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5H798oE004497 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 17 Jun 2019 03:09:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 293752AABB; Mon, 17 Jun 2019 07:09:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21A7917F70
	for <linux-cachefs@redhat.com>; Mon, 17 Jun 2019 07:09:05 +0000 (UTC)
Received: from mail3-165.sinamail.sina.com.cn (mail3-165.sinamail.sina.com.cn
	[202.108.3.165]) by mx1.redhat.com (Postfix) with SMTP id 9156D83F40
	for <linux-cachefs@redhat.com>; Mon, 17 Jun 2019 07:08:55 +0000 (UTC)
Received: from unknown (HELO webmail.sinamail.sina.com.cn)([10.41.14.96])
	by sina.com with SMTP
	id 5D073C80000040E7; Mon, 17 Jun 2019 15:08:49 +0800 (CST)
X-Sender: yangyuqi@sina.com
X-SMAIL-MID: 16474395009
Received: by webmail.sinamail.sina.com.cn (Postfix, from userid 495)
	id D1A8446400A2; Mon, 17 Jun 2019 15:08:48 +0800 (CST)
Date: Mon, 17 Jun 2019 15:08:48 +0800
Received: from yangyuqi@sina.com([124.204.48.178]) by m0.mail.sina.com.cn via
	HTTP; Mon, 17 Jun 2019 15:08:48 +0800 (CST)
From: <yangyuqi@sina.com>
To: "linux-cachefs" <linux-cachefs@redhat.com>,
	"dhowells" <dhowells@redhat.com>
MIME-Version: 1.0
X-Priority: 3
X-MessageID: 5d073c801f91363c_201906
X-Originating-IP: [10.41.14.96]
Message-Id: <20190617070848.D1A8446400A2@webmail.sinamail.sina.com.cn>
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.27]); Mon, 17 Jun 2019 07:08:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Mon, 17 Jun 2019 07:08:58 +0000 (UTC) for IP:'202.108.3.165'
	DOMAIN:'mail3-165.sinamail.sina.com.cn'
	HELO:'mail3-165.sinamail.sina.com.cn' FROM:'yangyuqi@sina.com'
	RCPT:''
X-RedHat-Spam-Score: -0.028  (FREEMAIL_FROM, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 202.108.3.165 mail3-165.sinamail.sina.com.cn 202.108.3.165
	mail3-165.sinamail.sina.com.cn <yangyuqi@sina.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Mon, 17 Jun 2019 04:54:04 -0400
Content-Disposition: inline
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [Linux-cachefs] About r FS-Cache
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: yangyuqi@sina.com
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Mon, 17 Jun 2019 08:54:45 +0000 (UTC)

Hello Doctor David,I'm a developer for NFS at Android OS, I want transplant FS-Cache to Android,I had look for source code at https://people.redhat.com/~dhowells/fscache/ ,I found only cachefilesd source code in the website, there not include fscache(kernel part).So, where have the fscache code can let me to transplant? thank you, looking forward to your answer.
Best Regards,Jerry


--------------------------------
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs
