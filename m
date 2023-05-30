Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A4119716E31
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 May 2023 21:55:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685476526;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QZkF0T2KaldP86IZtL4EzuQIC0oDJ+frMhknQ+VZ2ec=;
	b=bM3LDJ54x+zT05ZMwWQKn5Y0rRo+IYahCZI07/22f3X9+gknRmMvJSjTii4DcE9ZZ2fEYL
	rf8KjmarwD+oQgh5oQyp18EcjS8O+vRXQ/HlbqoHqw48vLb8aM0Hc1GGQjDdKJ31w7EJcY
	CnTbULdTeVcEM0Soy8yub2p95192jUA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-aMq4l_DdOHWe0Y4ICXasZg-1; Tue, 30 May 2023 15:55:23 -0400
X-MC-Unique: aMq4l_DdOHWe0Y4ICXasZg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9996A811E7F;
	Tue, 30 May 2023 19:55:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 298D8112132C;
	Tue, 30 May 2023 19:55:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CBC5719465A8;
	Tue, 30 May 2023 19:55:20 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AC43D1946595 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 30 May 2023 19:55:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 88B3540CFD46; Tue, 30 May 2023 19:55:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80B9140CFD45
 for <linux-cachefs@redhat.com>; Tue, 30 May 2023 19:55:19 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65C588032F5
 for <linux-cachefs@redhat.com>; Tue, 30 May 2023 19:55:19 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2105.outbound.protection.outlook.com [40.107.244.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-hqFTj2A3PEmJg1_8OL4LWQ-1; Tue, 30 May 2023 15:55:17 -0400
X-MC-Unique: hqFTj2A3PEmJg1_8OL4LWQ-1
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by PH8PR13MB6182.namprd13.prod.outlook.com (2603:10b6:510:259::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 19:55:15 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::5e55:9a39:751f:55f6]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::5e55:9a39:751f:55f6%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 19:55:14 +0000
Date: Tue, 30 May 2023 21:55:06 +0200
From: Simon Horman <simon.horman@corigine.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <ZHZUmj71oJYKYYLY@corigine.com>
References: <20230530141635.136968-1-dhowells@redhat.com>
 <20230530141635.136968-3-dhowells@redhat.com>
In-Reply-To: <20230530141635.136968-3-dhowells@redhat.com>
X-ClientProxiedBy: AM0PR10CA0102.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::19) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|PH8PR13MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: d2389c8b-f74f-4692-1dfe-08db6147c8d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: ounxAFoAEjYbTDoKI1qQVvxasgO5Yx9mGvTRH/JUgf2m9wLv1KGWGm71L6ZBjf5gEQWR/tigLort9JANn2mIXMAiKpDU+xZ27Ix6eDWbMRj1tXXxUBv6HTlH3J+RNJbzhhaNtbvjfUrmJtQfRPTUlWooZCsh/1CNg984qUZWlQ2P7XxB5nEaGj5rKltLDLtNOzKFq30DlHrUXchm2zHDxeEPNX8SEB9pDXblgpb4OR0QOkBi0yUMDghauNyHhGWAnKCsaD5o/ST2j7R3iJpZoY1GugRb2uL29yvYkVaoHz2rzVZNg46wb6e3LRwFJbsgvW9ZXexEo349VAoPDuIAwqrfdO+Yct3ehPBhhFfvvuNEz4EXs2ayc8UqDO1BSQfV00TKIWSMj/bMHujmJCMrjycbODa2OypsyLNPNVpRNfNTW6Y8ZH4FrphLSrgmfL3BOKJnCI4Olkh9avCiPRUs7YFcWsBJ5Few3SiQecoTYul4VwmRQHYoj65hs4/om+fcvVtHWZfGGFZmOPq91x4gYt51xDxSFs7ORZuO+f58LkY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR13MB4842.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39840400004)(376002)(396003)(366004)(346002)(136003)(451199021)(4744005)(478600001)(2906002)(186003)(6506007)(6512007)(5660300002)(8676002)(54906003)(8936002)(38100700002)(2616005)(966005)(6486002)(86362001)(41300700001)(316002)(36756003)(6666004)(4326008)(7416002)(44832011)(66556008)(66476007)(66946007)(6916009);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ePV5Mg2v+nXuak1La6s9TxA66j4ne3Sd2idZAkFsNZEOJbvrQr36LZpHaVMj?=
 =?us-ascii?Q?IR0JI2PDppAUUoOYrz2+jYws7caQcYWdTRWTu24Tdo28kvzjvtshCGP5bmt5?=
 =?us-ascii?Q?Bp/W2wZul6rUMJMLRXXntGx3XH6UXTD2Ll58nbQPZm3sAIvuGst9/R6C7ylD?=
 =?us-ascii?Q?9xcQa2tJUAb6N4Ro4orik5bBUWAmiotjKwCrsZl3AgR5QhaqzKHqYMSulPh8?=
 =?us-ascii?Q?nfWDKKRPqARmFleLcys7bTPKTTeyKDocDYaV/MoVl2glwQw6YEG9j1W7r2Jz?=
 =?us-ascii?Q?TNPNVpt+Dmq6G4KlfU+ZUUsos/jTnVBeCb5ae4ZhqLT+6dnNkTBLF6esPnS1?=
 =?us-ascii?Q?4mnASXLsUIrxqjGT9woqUYVMe+AD5Hp5TJFc5yA7KGcD7wma8u23oraX8KHG?=
 =?us-ascii?Q?xtynStSRqG71A73GiIQ62/BNOv38+eHHbVbtEam7+MnodaxqyJZUMBKqlb4e?=
 =?us-ascii?Q?cdNIUlrRENgz7nkFQ0cT5Hi/O1zDzKUgytsL/F09bnuIWp/t0a1vcnZr+uif?=
 =?us-ascii?Q?zSlLHlle3i8G8ufVhP0moX1QmyGt78c7VUHVnsVYOGnFUHVwLMTnJdH+lgP9?=
 =?us-ascii?Q?037xhHmYo0xILIj4daCLM19ITZX9a0Hvn4YKgjjjx/6vXYnosLg/NhP4X+59?=
 =?us-ascii?Q?F4ZOpxFyhcztTOeSCCVSXgiFrGK10QjI/7elhqaq7PQNvO/IwIliBlLJLlQn?=
 =?us-ascii?Q?cgZo/sAJuV/spHa93v/cc9MtPb+MRwKb3rndhILMBFWXav1vbDpKDmMPukc1?=
 =?us-ascii?Q?U+FXFItKefcawi8AUFwyKk57oLiNLs6FD8i25JXQnkmYEnNePR0PaNQA4YWN?=
 =?us-ascii?Q?TEG/iF8bmdVjzDVg1x2qIZidaHmJ0nmdQqnOe3MNFcBnhrS3639Bs1uOf6qi?=
 =?us-ascii?Q?xzWkRjGBAr+G1XuyvOKgV8n/1zDqMlP8nJz/jNQkoNbmyl3uaprK6BhUnK32?=
 =?us-ascii?Q?qBWfzlansOwyteeSf6muX1LjWbf5yWmYxlBNR3J2/LtgCktNLKayQwJXWfjx?=
 =?us-ascii?Q?+pANBgTxUN/JAcqZ2Ro0n6uljdqx/aSRYmJTRe+coh2gqRmC/ZH5Gso2AhQI?=
 =?us-ascii?Q?43kNCaxSQBaTHBBHGWR8b+lIx2gJ451ra2zGFNgEod0gQww1G32rbwrhqnre?=
 =?us-ascii?Q?v3BwhJO9ttSpouqicwGxPsFNLxF14jibF3TYUCbOQULrz+/QyLKkjZc14SQQ?=
 =?us-ascii?Q?+7cq6pEhYwDWixp+J4WtUd0rkyrsrw5tCcHvUCKj5M47LtM2liXmbbXZciFc?=
 =?us-ascii?Q?syVmO5X6vWVUqcjPC5sBwUcWUH0BVUEoToYe6VMBBtvjeDM8H6WV4rvIuikc?=
 =?us-ascii?Q?MRn7KU9ygTXLq4Sued1X5Pciz5JwtyxlxXc4kU84DtYfrcG9pySwE5uRCdw1?=
 =?us-ascii?Q?S58qLzRGCC+6Em+4Dp/HGlyTKwIYm8zxlcdW4iyFy3/aIecAxHy79y3Kmsoi?=
 =?us-ascii?Q?aGH1IpKzkNsspVg6ets6si83AoSpFqAmT0+71MRb1a+gexK3Ngr+mJlWw9Ov?=
 =?us-ascii?Q?379Bg1KoYrIxVbOfVWEgahUqTqOyMmutA+mVIGRaMBf9OnwXv7fuqLYk4rZl?=
 =?us-ascii?Q?55CYYTpiaFAE2vhVGqa3LqqoXcE91qh4X+atsqgEWLOegirAADoj9BNsEls8?=
 =?us-ascii?Q?LCtut+W61PgGdX0+9PEzFpBXjP/y+fRda4eidKlIXXJNH185xlb7cOhbAK+O?=
 =?us-ascii?Q?bN4UFg=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2389c8b-f74f-4692-1dfe-08db6147c8d7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 19:55:14.8689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rOD6j60HscxKHVJT0OMF+iZuqUTQhPWnBmxP+Wiczi6pOLFOtSy9A1ol1BSsV+5/npNal7PDE2jMUb6GH8RhJPABVskEwlYpwvCtGdyDy1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR13MB6182
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Linux-cachefs] [PATCH net-next v2 02/10] Fix a couple of
 spelling mistakes
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
Cc: Jens Axboe <axboe@kernel.dk>, Shyam Prasad N <nspmangalore@gmail.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-cifs@vger.kernel.org,
 Rohith Surabattula <rohiths.msft@gmail.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Steve French <sfrench@samba.org>, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, linux-cachefs@redhat.com,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: corigine.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 30, 2023 at 03:16:26PM +0100, David Howells wrote:
> Fix a couple of spelling mistakes in a comment.
> 
> Suggested-by: Simon Horman <simon.horman@corigine.com>
> Link: https://lore.kernel.org/r/ZHH2mSRqeL4Gs1ft@corigine.com/
> Link: https://lore.kernel.org/r/ZHH1nqZWOGzxlidT@corigine.com/
> Signed-off-by: David Howells <dhowells@redhat.com>

Reviewed-by: Simon Horman <simon.horman@corigine.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

