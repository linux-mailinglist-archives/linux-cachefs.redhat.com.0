Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAF271389E
	for <lists+linux-cachefs@lfdr.de>; Sun, 28 May 2023 10:02:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685260949;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hH9D6gvo+/PiywG7LGZ6W52oO4Km4EiLsfmyksDQ6nM=;
	b=ikV2vRwNXcMVIPnnRZqqeq1ZQMG134WmqmZSYw8gk6vuwDULXulEbrl37tDVfDY207o3Dw
	6wVhT/9gTFRvSAUGiPFwXVm049flzJ12hDUxP9yo5uTOSvtr6Me6yi6JzkKGQwclLolcZd
	SmCHy5SWGfnHiZZXzB2MYZlEN4ctNu4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-9f5a-i58MaOcuObdJGc-Yw-1; Sun, 28 May 2023 04:02:28 -0400
X-MC-Unique: 9f5a-i58MaOcuObdJGc-Yw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01068811E8F;
	Sun, 28 May 2023 08:02:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C8DDC492B0A;
	Sun, 28 May 2023 08:02:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 34A1019465A3;
	Sun, 28 May 2023 08:02:26 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 745E619465A0 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 26 May 2023 16:52:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8AECEC0004B; Fri, 26 May 2023 16:52:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 832B8C154D2
 for <linux-cachefs@redhat.com>; Fri, 26 May 2023 16:52:27 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64433101A52C
 for <linux-cachefs@redhat.com>; Fri, 26 May 2023 16:52:27 +0000 (UTC)
Received: from smtp-42aa.mail.infomaniak.ch (smtp-42aa.mail.infomaniak.ch
 [84.16.66.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-8qPTBpUdPISI7xLG7QEiJQ-1; Fri, 26 May 2023 12:52:25 -0400
X-MC-Unique: 8qPTBpUdPISI7xLG7QEiJQ-1
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4QSVpc2hLFzMq9gR;
 Fri, 26 May 2023 18:33:12 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4QSVpV20JTzMskdH; Fri, 26 May 2023 18:33:06 +0200 (CEST)
Message-ID: <75b4746d-d41e-7c9f-4bb0-42a46bda7f17@digikod.net>
Date: Fri, 26 May 2023 18:33:05 +0200
MIME-Version: 1.0
User-Agent: 
To: Christian Brauner <brauner@kernel.org>,
 Xiu Jianfeng <xiujianfeng@huawei.com>
References: <20230505081200.254449-1-xiujianfeng@huawei.com>
 <20230515-nutzen-umgekehrt-eee629a0101e@brauner>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
In-Reply-To: <20230515-nutzen-umgekehrt-eee629a0101e@brauner>
X-Infomaniak-Routing: alpha
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Sun, 28 May 2023 08:02:25 +0000
Subject: Re: [Linux-cachefs] [PATCH -next 0/2] lsm: Change inode_setattr()
 to take struct
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
Cc: mortonm@chromium.org, rafael@kernel.org, roberto.sassu@huawei.com,
 linux-unionfs@vger.kernel.org, linux-cifs@vger.kernel.org, paul@paul-moore.com,
 miklos@szeredi.hu, mpe@ellerman.id.au, jmorris@namei.org, code@tyhicks.com,
 linux-cachefs@redhat.com, linkinjeon@kernel.org, fred@cloudflare.com,
 serge@hallyn.com, nathanl@linux.ibm.com, selinux@vger.kernel.org,
 ecryptfs@vger.kernel.org, tom@talpey.com, linux-fsdevel@vger.kernel.org,
 wangweiyang2@huawei.com, viro@zeniv.linux.org.uk, dchinner@redhat.com,
 eparis@parisplace.org, hirofumi@mail.parknet.co.jp, gnoack3000@gmail.com,
 linux-nfs@vger.kernel.org, john.johansen@canonical.com,
 gregkh@linuxfoundation.org, stephen.smalley.work@gmail.com, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, senozhatsky@chromium.org,
 mcgrof@kernel.org, chuck.lever@oracle.com,
 linux-security-module@vger.kernel.org, casey@schaufler-ca.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: digikod.net
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"


On 15/05/2023 17:12, Christian Brauner wrote:
> On Fri, May 05, 2023 at 04:11:58PM +0800, Xiu Jianfeng wrote:
>> Hi,
>>
>> I am working on adding xattr/attr support for landlock [1], so we can
>> control fs accesses such as chmod, chown, uptimes, setxattr, etc.. inside
>> landlock sandbox. the LSM hooks as following are invoved:
>> 1.inode_setattr
>> 2.inode_setxattr
>> 3.inode_removexattr
>> 4.inode_set_acl
>> 5.inode_remove_acl
>> which are controlled by LANDLOCK_ACCESS_FS_WRITE_METADATA.
>>
>> and
>> 1.inode_getattr
>> 2.inode_get_acl
>> 3.inode_getxattr
>> 4.inode_listxattr
>> which are controlled by LANDLOCK_ACCESS_FS_READ_METADATA
> 
> It would be helpful to get the complete, full picture.
> 
> Piecemeal extending vfs helpers with struct path arguments is costly,
> will cause a lot of churn and will require a lot of review time from us.
> 
> Please give us the list of all security hooks to which you want to pass
> a struct path (if there are more to come apart from the ones listed
> here). Then please follow all callchains and identify the vfs helpers
> that would need to be updated. Then please figure out where those
> vfs helpers are called from and follow all callchains finding all
> inode_operations that would have to be updated and passed a struct path
> argument. So ultimately we'll end up with a list of vfs helpers and
> inode_operations that would have to be changed.
> 
> I'm very reluctant to see anything merged without knowing _exactly_ what
> you're getting us into.

Ultimately we'd like the path-based LSMs to reach parity with the 
inode-based LSMs. This proposal's goal is to provide users the ability 
to control (in a complete and easy way) file metadata access. For these 
we need to extend the inode_*attr hooks and inode_*acl hooks to handle 
paths. The chown/chmod hooks are already good.

In the future, I'd also like to be able to control directory traversals 
(e.g. chdir), which currently only calls inode_permission().

What would be the best way to reach this goal?

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

